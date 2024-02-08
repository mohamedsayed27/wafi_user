import 'package:flutter/cupertino.dart';
import 'package:wafi_user/presentation/widgets/car_rent_widgets/version_increament_button.dart';

import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/form_date_item.dart';
import '../shared_widgets/form_drom_down_widget.dart';
import '../shared_widgets/form_item_widget.dart';
import '../shared_widgets/form_upload_item_widegt.dart';

class CitizenResidentComponent extends StatelessWidget {
  const CitizenResidentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: FormItemWidget(title: "National ID/ Iqama", hintText: "**************",),),
              CustomSizedBox(width: 16,),
              Expanded(child: VersionCounter(text: 'Version',),),
            ],
          ),
        ),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: "Driver License Expiry Date",),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: "National ID/ Iqama Expiry Date",),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: "Date of Birth",),
        CustomSizedBox(height: 24,),
        FormDropDownWidget(title: "City",),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:"Driver License",isRequired: true,),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:"Driver License With Selfie",isRequired: true,),
      ],
    );
  }
}
