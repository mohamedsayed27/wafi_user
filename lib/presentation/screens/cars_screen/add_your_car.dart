import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/parameters/add_user_car_parameters.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations/locale_keys.g.dart';
import '../../business_logic/cars_cubit/cars_cubit.dart';
import '../../widgets/shared_widgets/cached_network_image_widget.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/form_drop_down_widget.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class AddYourCar extends StatefulWidget {
  const AddYourCar({super.key});

  @override
  State<AddYourCar> createState() => _AddYourCarState();
}

class _AddYourCarState extends State<AddYourCar> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //
  //   super.dispose();
  // }

  @override
  void dispose() {
    sl<CarsCubit>().empty();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.addYourCar.tr(),
      ),
      body: BlocProvider.value(
        value: sl<CarsCubit>()
          ..getCarTypes()
          ..getCarModels(),
        child: BlocBuilder<CarsCubit, CarsState>(
          builder: (context, state) {
            return CarsCubit.get(context).initCarLoading != null &&
                    CarsCubit.get(context).initCarLoading == true
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                    children: [
                      Text(
                        LocaleKeys.enterCarDetails.tr(),
                        style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      BlocBuilder<CarsCubit, CarsState>(
                        buildWhen: (prev, curr) {
                          if (curr is GetCarTypesLoading ||
                              curr is GetCarTypesError ||
                              curr != prev ||
                              curr is GetCarTypesSuccess) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        // bloc: CarsCubit()..getCarTypes(),

                        builder: (context, state) {
                          var cubit = CarsCubit.get(context);
                          return FormDropDownWidget(
                              items: cubit.carTypesList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Row(
                                          children: [
                                            CustomSizedBox(
                                              height: 32,
                                              width: 32,
                                              child: CachedNetworkImageWidget(
                                                imageUrl: e.imageUrl ?? "",
                                              ),
                                            ),
                                            const CustomSizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              e.title ?? "",
                                              style: CustomThemes.greyColor1CTextStyle(context)
                                                  .copyWith(
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              value: cubit.carType,
                              onChanged: cubit.changeCarType,
                              // isLoadingData: state is GetCarTypesLoading,
                              title: LocaleKeys.make.tr());
                        },
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      BlocBuilder<CarsCubit, CarsState>(
                        buildWhen: (currentState, nextState) {
                          if (currentState is GetModelsLoading ||
                              currentState != nextState ||
                              currentState is GetModelsError ||
                              currentState is GetModelsSuccess) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        // bloc: CarsCubit()..getCarModels(),
                        builder: (context, state) {
                          var cubit = CarsCubit.get(context);
                          return FormDropDownWidget(
                              items: cubit.carModelsList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.title ?? "",
                                          style:
                                              CustomThemes.greyColor1CTextStyle(context).copyWith(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: cubit.carModel,
                              onChanged: cubit.changeCarModel,
                              // isLoadingData: state is GetModelsLoading,
                              title: LocaleKeys.model.tr());
                        },
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      Text(
                        LocaleKeys.yearOfManufacture.tr(),
                        style: CustomThemes.greyColor16TextStyle(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal),
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      BlocBuilder<CarsCubit, CarsState>(
                        builder: (context, state) {
                          var cubit = CarsCubit.get(context);
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: const RoundedRectangleBorder(),
                                    child: YearPicker(
                                      firstDate: DateTime(1980),
                                      lastDate: DateTime.now(),
                                      selectedDate: cubit.dateTime,
                                      onChanged: (dateTime) {
                                        cubit.chooseTime(dateTime);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            borderRadius: BorderRadius.circular(6.r),
                            child: Ink(
                              height: 56.h,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: AppColors.borderColor,
                                  // width: 1.w,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  cubit.dateTime?.year.toString() ??
                                      LocaleKeys.yearOfManufacture.tr(),
                                  textAlign: TextAlign.start,
                                  style: cubit.dateTime == null
                                      ? CustomThemes.greyColor99TextStyle(context).copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal,
                                        )
                                      : CustomThemes.greyColor1CTextStyle(context).copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal,
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      BlocBuilder<CarsCubit, CarsState>(
                        buildWhen: (prv, cur) {
                          return false;
                        },
                        builder: (context, state) {
                          CarsCubit cubit = CarsCubit.get(context);
                          return Form(
                            key: formKey,
                            child: FormItemWidget(
                              title: LocaleKeys.chassisNumber.tr(),
                              controller: cubit.controller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LocaleKeys.fillTheField.tr();
                                } else {
                                  return null;
                                }
                              },
                              hintText: "**********",
                            ),
                          );
                        },
                      ),
                      const CustomSizedBox(
                        height: 160,
                      ),
                      BlocConsumer<CarsCubit, CarsState>(
                        listener: (context, state) {
                          final cubit = CarsCubit.get(context);
                          if (state is AddUserCarLoading) {
                            showProgressIndicator(context);
                          } else if (state is AddUserCarSuccess) {
                            cubit.dateTime = null;
                            cubit.carModel = null;
                            cubit.carType = null;
                            cubit.controller.clear();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            showToast(
                              errorType: 0,
                              message: state.baseResponseModel.message ?? "",
                            );
                          } else if (state is AddUserCarError) {
                            Navigator.pop(context);
                            showToast(errorType: 1, message: "error");
                          }
                        },
                        builder: (context, state) {
                          final cubit = CarsCubit.get(context);
                          return CustomGradientButton(
                            child: Text(
                              LocaleKeys.submit.tr(),
                              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {
                              if (cubit.carType == null) {
                                showToast(
                                    errorType: 1,
                                    message: "${LocaleKeys.PleaseSelect.tr()} ${LocaleKeys.make}");
                              } else if (cubit.carModel == null) {
                                showToast(
                                    errorType: 1,
                                    message: "${LocaleKeys.PleaseSelect.tr()} ${LocaleKeys.model}");
                              } else if (cubit.dateTime == null) {
                                showToast(
                                    errorType: 1,
                                    message:
                                        "${LocaleKeys.PleaseSelect.tr()} ${LocaleKeys.yearOfManufacture}");
                              } else if (formKey.currentState!.validate()) {
                                if (cubit.initCarLoading == null) {
                                  cubit.addUserCar(
                                    addCarParameters: AddCarParameters(
                                      carTypeId: cubit.carType?.id?.toString() ?? "",
                                      carModelId: cubit.carModel?.id?.toString() ?? "",
                                      year: cubit.dateTime?.year.toString() ?? "",
                                      structureNumber: cubit.controller.text,
                                    ),
                                  );
                                } else {
                                  cubit.updateUserCar(
                                    addCarParameters: AddCarParameters(
                                      carTypeId: cubit.carType?.id?.toString() ?? "",
                                      carModelId: cubit.carModel?.id?.toString() ?? "",
                                      carUserId: cubit.carId?.toString() ?? "",
                                      year: cubit.dateTime?.year.toString() ?? "",
                                      structureNumber: cubit.controller.text,
                                    ),
                                  );
                                }
                              }
                            },
                          );
                        },
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
