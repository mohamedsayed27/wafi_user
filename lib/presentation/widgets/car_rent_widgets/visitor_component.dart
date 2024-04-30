import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/form_date_item.dart';
import '../shared_widgets/form_item_widget.dart';
import '../shared_widgets/form_upload_item_widegt.dart';

class VisitorComponent extends StatelessWidget {
  const VisitorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: FormItemWidget(title: LocaleKeys.nationalIdIqama.tr(), hintText: "**************",),),
              CustomSizedBox(width: 16,),
              Expanded(child: FormItemWidget(title: LocaleKeys.driverLicense.tr(), hintText: "**************",),),
            ],
          ),
        ),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: LocaleKeys.driverLicenseExpiryDate.tr()),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: LocaleKeys.passportExpiryDate.tr(),),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: LocaleKeys.dateOfBirth.tr(),),
        CustomSizedBox(height: 24,),
        FormItemWidget(title: LocaleKeys.citizenship.tr(), hintText: LocaleKeys.citizenship.tr(),),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:LocaleKeys.internationalDriverLicenseImage.tr(),isRequired: true,),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:LocaleKeys.passportFrontImage.tr(),isRequired: true,),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:LocaleKeys.driverLicenseWithSelfie.tr(),),
      ],
    );
  }
}
