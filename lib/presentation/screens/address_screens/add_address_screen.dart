import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/data/models/address_model/address_model.dart';
import 'package:wafi_user/presentation/business_logic/address_cubit/address_cubit.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/text_shimmer_widget.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/parameters/address_parameters.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';

class AddAddressScreen extends StatefulWidget {
  final AddressModel? addressModel;
  const AddAddressScreen({super.key, this.addressModel});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
   TextEditingController _addressDescriptionController = TextEditingController();
   TextEditingController _streetNameController = TextEditingController();
   TextEditingController _buildingNumberController = TextEditingController();
   TextEditingController _floorNumberController = TextEditingController();
   TextEditingController _flatNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void initEditFields(){
    _addressDescriptionController = TextEditingController(text: widget.addressModel?.addressText);
    _streetNameController = TextEditingController(text: widget.addressModel?.street);
    _buildingNumberController = TextEditingController(text: widget.addressModel?.building.toString());
    _floorNumberController = TextEditingController(text: widget.addressModel?.floor.toString());
    _flatNumberController = TextEditingController(text: widget.addressModel?.flat.toString());
    context.read<AddressCubit>().initAddressCameraPositionOnEditAddress(widget.addressModel!);
  }

  @override
  void initState() {
    super.initState();
    if(widget.addressModel!=null){
      initEditFields();
    }
    print("context_readAddressCubit_addressCameraPosition");
    print(context.read<AddressCubit>().addressCameraPosition);
    if (context.read<AddressCubit>().addressCameraPosition == null) {
      context.read<AddressCubit>().getUserCurrentLocation();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Address",
      ),
      body: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if(state is AddAddressLoading){
            showProgressIndicator(context);
          }else if(state is AddAddressSuccess){
            Navigator.pop(context);
            context.read<AddressCubit>().getUserAddressList();
            showToast(errorType: 0, message: state.response.message??"");
            Navigator.pop(context);
          }else if (state is AddAddressError){
            Navigator.pop(context);
            showToast(errorType: 0, message: state.message);
          }
          if(state is UpdateAddressLoading){
            showProgressIndicator(context);
          }else if(state is UpdateAddressSuccess){
            Navigator.pop(context);
            context.read<AddressCubit>().getUserAddressList();
            showToast(errorType: 0, message: state.response.message??"");
            Navigator.pop(context);
          }else if (state is UpdateAddressError){
            Navigator.pop(context);
            showToast(errorType: 0, message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddressCubit>();
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 32.h,
              ),
              children: [
                DetailsContainer(
                  child: Row(
                    children: [
                      Expanded(
                        child: state is GetCurrentLocationLoading || state is InitAddressCameraPositionOnEditAddressLoading
                            ? const TextShimmerWidget()
                            : Text(
                                cubit.googleMapsSearchBarHint ?? "",
                                style: CustomThemes.greyColor1CTextStyle(context)
                                    .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      CustomThemes.greyColor1CTextStyle(context)
                                          .color!
                                          .withOpacity(0.8),
                                ),
                              ),
                      ),
                      const CustomSizedBox(
                        width: 16,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ScreenName.addressGoogleMap,
                            arguments: [cubit],
                          );
                        },
                        child: GradientWidget(
                          gradientList: AppColors.gradientColorsList,
                          isGradient: true,
                          child: Text(
                            LocaleKeys.change.tr(),
                            style:
                                CustomThemes.whiteColoTextTheme(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const CustomSizedBox(
                  height: 24,
                ),
                CustomTextField(
                  hintText: "Address description",
                  controller: _addressDescriptionController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: "Street name",
                  controller: _streetNameController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: "Building number",
                  controller: _buildingNumberController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: "Floor number",
                  controller: _floorNumberController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: "Flat number",
                  controller: _flatNumberController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                const CustomSizedBox(
                  height: 32,
                ),
                CustomGradientButton(
                  child: Text(
                    LocaleKeys.submit.tr(),
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      if(widget.addressModel==null){
                        cubit.addAddress(
                          AddressParameters(
                            longitude: cubit.addressCameraPosition?.target.longitude
                                .toString(),
                            latitude: cubit.addressCameraPosition?.target.latitude
                                .toString(),
                            addressText: _addressDescriptionController.text,
                            building: _buildingNumberController.text,
                            flat: _flatNumberController.text,
                            floor: _floorNumberController.text,
                            locationName: cubit.googleMapsSearchBarHint ?? "",
                            street: _streetNameController.text,
                          ),
                        );
                      }else{
                        cubit.updateAddress(
                          AddressParameters(
                            longitude: cubit.addressCameraPosition?.target.longitude
                                .toString(),
                            latitude: cubit.addressCameraPosition?.target.latitude
                                .toString(),
                            addressText: _addressDescriptionController.text,
                            building: _buildingNumberController.text,
                            flat: _flatNumberController.text,
                            addresId: widget.addressModel?.id?.toString()??"",
                            floor: _floorNumberController.text,
                            locationName: cubit.googleMapsSearchBarHint ?? "",
                            street: _streetNameController.text,
                          ),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
