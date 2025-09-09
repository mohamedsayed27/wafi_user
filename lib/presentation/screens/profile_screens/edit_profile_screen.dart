import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/data/models/profile_model/user_data_model.dart';
import 'package:wafi_user/presentation/business_logic/profile_cubit/profile_cubit.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/models/profile_model/user_data_params.dart';
import '../../../translations/locale_keys.g.dart';
import '../../business_logic/profile_cubit/update_profile_cubit.dart';
import '../../widgets/shared_widgets/cached_network_image_widget.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class EditProfileScreen extends StatelessWidget {
  final UserDataModel? userDataModel;
  const EditProfileScreen({super.key, this.userDataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.editProfile.tr(),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => sl<UpdateProfileCubit>()..initData(userDataModel: userDataModel),
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(listener: (context, state) {
          UpdateProfileCubit cubit = UpdateProfileCubit.get(context);
          if (state is PickImageLoading) {
            showProgressIndicator(context);
            cubit.isDataChanged();
          } else if (state is PickImageSuccess) {
            cubit.isDataChanged();
            Navigator.pop(context);
          } else if (state is PickImageError) {
            cubit.isDataChanged();
            Navigator.pop(context);
          }

          if (state is UpdateUserDataLoading) {
            showProgressIndicator(context);
          } else if (state is UpdateUserDataSuccess) {
            Navigator.pop(context);
            ProfileCubit.get(context).fetchProfile();
            Navigator.pop(context);
          } else if (state is UpdateUserDataError) {
            Navigator.pop(context);
            showToast(errorType: 1, message: state.error);
          }
        }, builder: (context, state) {
          UpdateProfileCubit cubit = UpdateProfileCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              children: [
                Center(
                  child: CustomSizedBox(
                    height: 140,
                    width: 160,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 120.h,
                            width: 120.w,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 2.w,
                              ),
                            ),
                            child: cubit.image == null
                                ? CachedNetworkImageWidget(
                                    imageUrl: cubit.userDataModel?.image ?? '',
                                    errorWidget: Image.asset(
                                      ImagesPath.userNullImage,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )
                                : Image.file(
                                    cubit.image!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.shadowColor(value: 0.22),
                                  offset: Offset.zero,
                                  blurRadius: 40.r)
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              cubit.pickUpImages();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              backgroundColor: AppColors.whiteColor,
                              foregroundColor: AppColors.primaryColor,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const CustomSizedBox(height: 16),
                FormItemWidget(
                  title: LocaleKeys.name.tr(),
                  hintText: LocaleKeys.userName.tr(),
                  onChanged: (value) {
                    cubit.isDataChanged();
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.thisFieldCannotBeEmpty.tr();
                    }
                    return null;
                  },
                  controller: cubit.nameController,
                ),
                const CustomSizedBox(height: 16),
                FormItemWidget(
                  title: LocaleKeys.email.tr(),
                  hintText: LocaleKeys.userEmail.tr(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.thisFieldCannotBeEmpty.tr();
                    }
                    return null;
                  },
                  onChanged: (value) {
                    cubit.isDataChanged();
                    return null;
                  },
                  controller: cubit.emailController,
                ),
                const CustomSizedBox(height: 16),
                // RichText(
                //   text: TextSpan(
                //     text: LocaleKeys.phoneNumber.tr(),
                //     style: CustomThemes.greyColor16TextStyle(context).copyWith(
                //         fontSize: 14.sp, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                //     //   children: [
                //     //     if (false)
                //     //       TextSpan(
                //     //         text: " *",
                //     //         style: TextStyle(
                //     //           fontSize: 16.sp,
                //     //           color: Colors.red,
                //     //         ),
                //     //       )
                //     //   ],
                //   ),
                // ),

                // IntlPhoneField(
                //   // dropDownPadding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
                //   // dropdownDecoration: BoxDecoration(
                //   //   shape: BoxShape.rectangle,
                //   //   borderRadius: BorderRadius.circular(8.r),
                //   //   border: Border.all(
                //   //       color: AppColors.borderColor,
                //   //       width: 1.w,
                //   //   )
                //   // ),
                //   decoration: InputDecoration(
                //     // labelText: 'Phone Number',
                //     helperStyle: CustomThemes.greyColor99TextStyle(context)
                //         .copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                //     label: null,
                //     hintText: LocaleKeys.phoneNumber.tr(),
                //     floatingLabelAlignment: FloatingLabelAlignment.start,
                //     contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.r),
                //       borderSide: BorderSide(
                //         color: AppColors.borderColor,
                //         width: 1.w,
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.r),
                //       borderSide: BorderSide(
                //         color: AppColors.borderColor,
                //         width: 1.w,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.r),
                //       borderSide: BorderSide(
                //         color: AppColors.borderColor,
                //         width: 1.w,
                //       ),
                //     ),
                //   ),
                FormItemWidget(
                  title: LocaleKeys.phoneNumber.tr(),
                  hintText: 'EX :- 00000000000',
                  controller: cubit.phoneController,
                  enabled: false,
                  onChanged: (value) {
                    cubit.isDataChanged();
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.pleaseEnterPhoneNumber.tr();
                    }
                    return null;
                  },
                ),
                // const CustomSizedBox(
                //   height: 16,
                // ),
                // FormItemWidget(
                //   title: LocaleKeys.password.tr(),
                //   hintText: LocaleKeys.yourPassword.tr(),
                //   isNotVisible: true,
                //   enabled: false,
                //   controller: TextEditingController(text: "0000000000"),
                //   maxLines: 1,
                //   suffixIcon: IconButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, ScreenName.changePasswordScreen);
                //     },
                //     icon: GradientSvg(
                //       svgPath: SvgPath.pen,
                //       height: 16.h,
                //       width: 16.w,
                //     ),
                //   ),
                // ),
                const CustomSizedBox(
                  height: 32,
                ),
                CustomGradientButton(
                  onPressed: state is ChangeProfileData && state.isDataChanged
                      ? () async {
                          if (cubit.formKey.currentState!.validate()) {
                            UserDataParams params = UserDataParams(
                              name: cubit.nameController.text,
                              email: cubit.emailController.text,
                              phone: cubit.phoneController.text,
                              image: cubit.image,
                            );
                            print(await params.toJson());
                            cubit.updateProfile(params);
                          }
                        }
                      : null,
                  child: Text(
                    LocaleKeys.update.tr(),
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
