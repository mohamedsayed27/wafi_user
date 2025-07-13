import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wafi_user/presentation/widgets/car_rent_widgets/version_increament_button.dart';

import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/form_date_item.dart';
import '../shared_widgets/form_drop_down_widget.dart';
import '../shared_widgets/form_item_widget.dart';
import '../shared_widgets/form_upload_item_widegt.dart';

class CitizenResidentComponent extends StatelessWidget {
  const CitizenResidentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: FormItemWidget(
                  title: LocaleKeys.nationalIdIqama.tr(),
                  hintText: "**************",
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                child: VersionCounter(
                  text: LocaleKeys.version.tr(),
                ),
              ),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        FormDateWidget(
          title: LocaleKeys.driverLicenseExpiryDate.tr(),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        FormDateWidget(
          title: LocaleKeys.nationalIdIqama.tr(),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        FormDateWidget(
          title: LocaleKeys.dateOfBirth.tr(),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        FormDropDownWidget(
          items: dummyCity
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          title: LocaleKeys.city.tr(),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        FormUploadItemWidget(
          title: LocaleKeys.driverLicense.tr(),
          isRequired: true,
        ),
        const CustomSizedBox(
          height: 24,
        ),
        FormUploadItemWidget(
          title: LocaleKeys.driverLicenseWithSelfie.tr(),
          isRequired: true,
        ),
      ],
    );
  }
}
