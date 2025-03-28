import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(4, 4),
                color: AppColors.shadowColor(),
                blurRadius: 8.r
            ),
            BoxShadow(
                offset: const Offset(-4, -4),
                color: AppColors.shadowColor(),
                blurRadius: 8.r
            )
          ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesPath.tracmax,
                    height: 12.h,
                    width: 84.w,
                  ),
                  const CustomSizedBox(height: 8,),
                  Text(
                    "P Zero PZ4 L",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomSizedBox(height: 8,),
                  Text(
                    "285/40 R22 110Y",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(
                ImagesPath.dummyTire,
                height: 80.h,
                width: 80.w,
              ),
            ],
          ),
          const CustomSizedBox(height: 16,),
          const CustomDivider(
            height: 1.5,
          ),
          const CustomSizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "139 SAR",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomSizedBox(width: 100,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomSizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          onPressed: () {
                            if(counter>1){
                              counter--;
                              setState(() {

                              });
                            }
                          },
                          icon: const Icon(Icons.remove),
                          style: IconButton.styleFrom(padding: EdgeInsets.zero),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "$counter",
                          textAlign: TextAlign.center,
                          style: CustomThemes.greyColor16TextStyle(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      CustomSizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          onPressed: () {
                            counter++;
                            setState(() {

                            });
                          },
                          icon: const Icon(Icons.add),
                          style: IconButton.styleFrom(padding: EdgeInsets.zero),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
