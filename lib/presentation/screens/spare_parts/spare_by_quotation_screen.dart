import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/enums/yes_no_enum.dart';
import 'package:wafi_user/core/parameters/spare_by_quotation_parameters.dart';
import 'package:wafi_user/presentation/business_logic/address_cubit/address_cubit.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../../core/enums/address_status_enum.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/models/address_model/address_model.dart';
import '../../../presentation/business_logic/car_spare_parts_cubit/car_spare_by_quotation_cubit.dart';
import '../../../presentation/widgets/shared_widgets/custom_app_bar.dart';
import '../../../presentation/widgets/shared_widgets/custom_sized_box.dart';
import '../../../presentation/widgets/shared_widgets/gradient_svg.dart';
import '../../widgets/spare_parts/spare_submit_dialog.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient_widgets.dart';
import '../../widgets/shared_widgets/text_shimmer_widget.dart';

class SpareByQuotationScreen extends StatefulWidget {
  const SpareByQuotationScreen({super.key});

  @override
  State<SpareByQuotationScreen> createState() => _SpareByQuotationScreenState();
}

class _SpareByQuotationScreenState extends State<SpareByQuotationScreen> {
  final TextEditingController nameOfPartController = TextEditingController();
  final TextEditingController partNumberController = TextEditingController();
  final TextEditingController anySpecificationController = TextEditingController();
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameOfPartController.dispose();
    partNumberController.dispose();
    anySpecificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.spareParts.tr(),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => sl<CarSpareByQuotationCubit>(),
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 32.h,
            ),
            children: [
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  final addressCubit = context.read<AddressCubit>();
                  final addressList = addressCubit.addressList;

                  String addressText = "Add Address";
                  if (addressList.isNotEmpty) {
                    final activeAddress = addressList.firstWhere(
                        (address) => address.status == AddressStatusEnum.active.name,
                        orElse: () => const AddressModel());
                    addressText = activeAddress.addressText ?? "Select Your Default Address";
                  }

                  return DetailsContainer(
                    child: Row(
                      children: [
                        Expanded(
                          child: state is GetUserAddressLoading
                              ? const TextShimmerWidget(width: 80, height: 8)
                              : Text(
                                  addressText,
                                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: CustomThemes.greyColor1CTextStyle(context)
                                        .color!
                                        .withOpacity(0.8),
                                  ),
                                ),
                        ),
                        const CustomSizedBox(
                          width: 16,
                        ),
                        TextButton(
                          onPressed: state is GetUserAddressLoading
                              ? null
                              : () {
                                  Navigator.pushNamed(
                                    context,
                                    ScreenName.addressScreen,
                                    arguments: [addressCubit],
                                  );
                                },
                          child: GradientWidget(
                            gradientList: AppColors.gradientColorsList,
                            isGradient: true,
                            child: Text(
                              LocaleKeys.change.tr(),
                              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const CustomSizedBox(
                height: 24,
              ),
              FormItemWidget(
                title: LocaleKeys.nameOfPart.tr(),
                controller: nameOfPartController,
                hintText: "",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "You must fill this field";
                  }
                  return null;
                },
              ),
              const CustomSizedBox(
                height: 24,
              ),
              FormItemWidget(
                title: LocaleKeys.partNumber.tr(),
                hintText: "",
                isOptional: true,
                controller: partNumberController,
              ),
              const CustomSizedBox(
                height: 24,
              ),
              FormItemWidget(
                title: LocaleKeys.anySpecifications.tr(),
                controller: anySpecificationController,
                hintText: "",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "You must fill this field";
                  }
                  return null;
                },
              ),
              const CustomSizedBox(
                height: 24,
              ),
              Text(
                LocaleKeys.uploadImages.tr(),
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              BlocConsumer<CarSpareByQuotationCubit, CarSpareByQuotationState>(
                listener: (context, state) {
                  if (state is PickImagesLoading) {
                    showProgressIndicator(context);
                  } else if (state is PickImagesSuccess) {
                    Navigator.pop(context);
                  } else if (state is PickImagesError) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  var cubit = CarSpareByQuotationCubit.get(context);
                  return cubit.imagesList.isNotEmpty
                      ? SizedBox(
                          height: 90.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => UploadedImageWidget(
                                    image: cubit.imagesList[index],
                                    onTap: () {
                                      cubit.removeImage(cubit.imagesList[index]);
                                    },
                                  ),
                                  separatorBuilder: (_, index) => const SizedBox(
                                    width: 8,
                                  ),
                                  itemCount: cubit.imagesList.length,
                                ),
                              ),
                              const CustomSizedBox(
                                width: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.pickUpObjectImages();
                                },
                                borderRadius: BorderRadius.circular(16),
                                child: DottedBorder(
                                  color: AppColors.primaryColor,
                                  borderType: BorderType.RRect,
                                  dashPattern: const [
                                    8,
                                    4,
                                  ],
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 27.w,
                                    vertical: 27.h,
                                  ),
                                  radius: const Radius.circular(16),
                                  child: GradientSvg(
                                    svgPath: SvgPath.add,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: InkWell(
                            onTap: () {
                              cubit.pickUpObjectImages();
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: DottedBorder(
                              stackFit: StackFit.loose,
                              color: AppColors.primaryColor,
                              borderType: BorderType.RRect,
                              dashPattern: const [8, 4],
                              padding: EdgeInsets.symmetric(
                                horizontal: 27.w,
                                vertical: 27.h,
                              ),
                              radius: const Radius.circular(16),
                              child: GradientSvg(
                                svgPath: SvgPath.add,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ),
                        );
                },
              ),
              const CustomSizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      gradient: LinearGradient(
                        colors: AppColors.gradientColorsList,
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.maximumDensity,
                          vertical: VisualDensity.maximumDensity),
                      focusColor: AppColors.whiteColor,
                      fillColor: WidgetStateProperty.all(
                        isChecked ? Colors.transparent : AppColors.whiteColor,
                      ),
                      checkColor: AppColors.whiteColor,
                      side: const BorderSide(color: AppColors.whiteColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r),
                        side: const BorderSide(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  const CustomSizedBox(
                    width: 8,
                  ),
                  Text(
                    LocaleKeys.alsoQuotations.tr(),
                    style: CustomThemes.greyColor16TextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 24,
              ),
              BlocConsumer<CarSpareByQuotationCubit, CarSpareByQuotationState>(
                  listener: (context, state) {
                if (state is SendQuotationOrderLoading) {
                  showProgressIndicator(context);
                } else if (state is SendQuotationOrderSuccess) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) => const SpareSubmitDialog(),
                  );
                } else if (state is SendQuotationOrderError) {
                  Navigator.pop(context);
                  showToast(errorType: 1, message: state.error);
                }
              }, builder: (context, state) {
                var cubit = CarSpareByQuotationCubit.get(context);
                return CustomGradientButton(
                  child: Text(
                    LocaleKeys.submitRequest.tr(),
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (cubit.imagesList.isNotEmpty) {
                        cubit.sendQuotationOrder(
                          parameters: SpareByQuotationParameters(
                            name: nameOfPartController.text,
                            partNum:
                                partNumberController.text.isEmpty ? "" : partNumberController.text,
                            notes: anySpecificationController.text,
                            used: isChecked ? YesNo.yes : YesNo.no,
                            images: cubit.imagesList,
                            addressId: AddressCubit.get(context)
                                    .addressList
                                    .firstWhere((element) => element.status == "active")
                                    .id
                                    ?.toString() ??
                                "0",
                          ),
                        );
                      } else {
                        showToast(errorType: 1, message: "You must add images");
                      }
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class UploadedImageWidget extends StatelessWidget {
  final File image;
  final void Function()? onTap;
  const UploadedImageWidget({
    super.key,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.h,
      width: 88.w,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 80.w,
              width: 80.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: GradientSvg(
              svgPath: SvgPath.remove,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
