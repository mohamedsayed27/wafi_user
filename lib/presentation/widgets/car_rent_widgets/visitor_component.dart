import 'package:flutter/cupertino.dart';

import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/form_date_item.dart';
import '../shared_widgets/form_item_widget.dart';
import '../shared_widgets/form_upload_item_widegt.dart';

class VisitorComponent extends StatelessWidget {
  const VisitorComponent({super.key});

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
              Expanded(child: FormItemWidget(title: "Driver License No.", hintText: "**************",),),
            ],
          ),
        ),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: "Driver License Expiry Date",),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: "Pasport Expiry Date",),
        CustomSizedBox(height: 24,),
        FormDateWidget(title: "Date of Birth",),
        CustomSizedBox(height: 24,),
        FormItemWidget(title: "Citizenship", hintText: "Citizenship",),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:"International Driver License Image",isRequired: true,),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:"Passport Front Image",isRequired: true,),
        CustomSizedBox(height: 24,),
        FormUploadItemWidget(title:"Driver License With Selfie",),
      ],
    );
  }
}
