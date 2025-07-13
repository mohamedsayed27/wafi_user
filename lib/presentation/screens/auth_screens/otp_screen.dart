import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/cache_helper/cache_keys.dart';
import '../../../core/cache_helper/shared_pref_methods.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../business_logic/auth_cubit/auth_cubit.dart';
import '../../widgets/auth_widgets/opt_field_builder.dart';
import '../../widgets/auth_widgets/screen_title_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/logo_app_bar.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is OtpLoading) {
            showProgressIndicator(context);
          } else if (state is OtpSuccess) {
            Navigator.pop(context);
            showToast(
                errorType: state.otpModel.status! ? 0 : 1, message: state.otpModel.message ?? "");
            await CacheHelper.saveData(
              key: CacheKeys.token,
              value: state.otpModel.data?.token ?? "",
            ).then(
              (value) {
                if (state.otpModel.status!) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ScreenName.mainLayoutScreen,
                    (routes) => false,
                  );
                }
              },
            );
          } else if (state is OtpError) {
            Navigator.pop(context);
            showToast(
              errorType: 0,
              message: state.error,
            );
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Form(
            key: otpFormKey,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  children: [
                    ScreenTitleWidget(
                      title: LocaleKeys.verification.tr(),
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.enterOtp.tr(),
                      style: CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    PinFieldBuilder(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.pleaseEnterCode.tr();
                        }
                        return null;
                      },
                      controller: controller,
                    ),
                    const CustomSizedBox(
                      height: 40,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 80.h,
                  left: 16.w,
                  right: 16.w,
                  child: CustomGradientButton(
                    child: Text(
                      LocaleKeys.submit.tr(),
                      style: CustomThemes.whiteColoTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      if (otpFormKey.currentState!.validate()) {
                        if (controller.text.length >= 4) {
                          cubit.otp(code: controller.text);
                        } else {
                          showToast(errorType: 1, message: LocaleKeys.pleaseEnterCode.tr());
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
