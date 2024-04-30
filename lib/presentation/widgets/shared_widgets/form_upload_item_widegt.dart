import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/car_rent_widgets/upload_file_widget.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';
import 'custom_text_form_field.dart';

class FormUploadItemWidget extends StatelessWidget {
  final String title;
  final bool isRequired;

  const FormUploadItemWidget({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal
            ),
            children: [
              if (isRequired)
                TextSpan(
                  text: "  (${LocaleKeys.required.tr()})",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                  ),
                )
            ],
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        UploadFileContainer(),
      ],
    );
  }
}
