import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const CachedNetworkImageWidget({super.key, required this.imageUrl, this.fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit??BoxFit.cover,
      imageUrl: imageUrl,
      height: height?.h,
      width: width?.w,
      httpHeaders: const {
        'User-Agent': 'Chrome/96.0.4664.110',
      },
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}