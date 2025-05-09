import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../presentation/business_logic/auth_cubit/auth_cubit.dart';
import '../../../presentation/widgets/shared_widgets/custom_sized_box.dart';
import '../../../presentation/widgets/shared_widgets/logo_app_bar.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/auth_widgets/screen_title_widget.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showProgressIndicator(context);
          } else if (state is LoginSuccess) {
            Navigator.pop(context);
            showToast(errorType: state.baseResponseModel!.status! ? 0 : 1,
                message: state.baseResponseModel?.message ?? "");
            if (state.baseResponseModel!.status!) {
              Navigator.pushNamed(
                context,
                ScreenName.otpScreen,
              );
            }
          } else if (state is LoginError) {
            Navigator.pop(context);
            showToast(
              errorType: 0,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Form(
            key: loginFormKey,
            child: Stack(
              children: [
                ListView(
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  children: [
                    ScreenTitleWidget(
                      title: LocaleKeys.login.tr(),
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    FormItemWidget(
                      title: LocaleKeys.phoneNumber.tr(),
                      textDirection: TextDirection.ltr,
                      hintText: 'EX :- 00000000000',
                      controller: controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.pleaseEnterPhoneNumber.tr();
                        }
                        return null;
                      },
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    Text(
                      LocaleKeys.otpMessage.tr(),
                      style:
                      CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: CustomThemes
                            .greyColor1CTextStyle(context)
                            .color!
                            .withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
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
                      LocaleKeys.proceed.tr(),
                      style: CustomThemes.whiteColoTextTheme(context)
                          .copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        cubit.login(phone: controller.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
