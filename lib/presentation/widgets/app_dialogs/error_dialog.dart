import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/lottie_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

class ErrorDialog extends StatelessWidget {
  final String description;
  final String successText;
  final void Function()? successClicked;
  final String cancelText;
  final void Function()? cancelClicked;

  const ErrorDialog({
    super.key,
    required this.description,
    required this.successText,
    this.successClicked,
    required this.cancelText,
    this.cancelClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              LottiePath.error,
              height: 104.h,
              width: 104.w,
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            "Something went wrong",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          const CustomSizedBox(
            height: 4,
          ),
          Text(
            description,
            style: CustomThemes.greyColor75TextStyle(context).copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: CustomGradientButton(
                  onPressed: successClicked ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Text(
                    successText,
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomOutlinedButton(
                  borderColor: AppColors.primaryColor,
                  onPressed: cancelClicked ??
                      () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          ScreenName.mainLayoutScreen,
                          (route) => false,
                        );
                      },
                  padding: EdgeInsets.zero,
                  style: CustomThemes.primaryTextStyle(context),
                  borderRadius: 6,
                  child: Text(
                    cancelText,
                    style: CustomThemes.primaryTextStyle(context).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ).symmetricPadding(horizontal: 16.w, vertical: 32.h),
    );
  }
}
