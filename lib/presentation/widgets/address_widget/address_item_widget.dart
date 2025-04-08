import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/app_dialogs/warning_dialog.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/enums/address_status_enum.dart';
import '../../../data/models/address_model/address_model.dart';
import '../shared_widgets/gradient widgets.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressModel? address;
  final void Function()? onChangeAddressClicked;
  final void Function()? onDeleteAddressClicked;
  final void Function()? isEdit;

  const AddressItemWidget({
    super.key,
    this.address,
    this.isEdit,
    required this.onChangeAddressClicked, this.onDeleteAddressClicked,
  });

  @override
  Widget build(BuildContext context) {
    bool isDefault = address?.status != null &&
        address!.status!.contains(AddressStatusEnum.active.name);
    return ListTile(
      onTap: isDefault
          ? null
          : () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return WarningDialog(
                    description: "You will change your default address",
                    successText: 'Ok',
                    cancelText: 'Cancel',
                    cancelClicked: () {
                      Navigator.pop(context);
                    },
                    successClicked: onChangeAddressClicked,
                  );
                },
              );
            },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: isEdit,
            child: GradientWidget(
              gradientList: AppColors.gradientColorsList,
              isGradient: true,
              child: Text(
                "Edit",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return WarningDialog(
                  description: "You will delete your address",
                  successText: 'Delete',
                  cancelText: 'Cancel',
                  cancelClicked: () {
                    Navigator.pop(context);
                  },
                  successClicked: onDeleteAddressClicked,
                );
              },
            );
          }, icon: GradientSvg(svgPath: SvgPath.delete,width: 16.w,)),
        ],
      ),
      splashColor: isDefault
          ? AppColors.thirdGradientColor.withOpacity(0.1)
          : AppColors.greyColorD8.withOpacity(0.1),
      tileColor: isDefault
          ? AppColors.thirdGradientColor.withOpacity(0.08)
          : AppColors.greyColorD8.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.w,
          color:
              isDefault ? AppColors.thirdGradientColor : AppColors.greyColor75,
        ),
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      style: ListTileStyle.list,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: EdgeInsetsDirectional.only(
        start: 16.w,
        // vertical: 0,
      ),
      title: Text(address?.locationName ?? ""),
      subtitle: Text(address?.addressText ?? ""),
      titleTextStyle: CustomThemes.greyColor1CTextStyle(context).copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      subtitleTextStyle: CustomThemes.greyColor16TextStyle(context).copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
