
import 'package:easy_localization/easy_localization.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../enums/categories_type_enum.dart';

class DummyData {
  static List<Map<String, dynamic>> categoriesList =[
    {
      "image":ImagesPath.categoriesDummy2,
      "title": LocaleKeys.carServiceAndMaintenance.tr(),
      "type":CategoriesTypeEnum.carServices,
    },
    {
      "image":ImagesPath.categoriesDummy3,
      "title": LocaleKeys.carSpareParts.tr(),
      "type":CategoriesTypeEnum.carSpareParts,
    },
    {
      "image":ImagesPath.categoriesDummy4,
      "title": LocaleKeys.carRental.tr(),
      "type":CategoriesTypeEnum.carRental,
    },
    {
      "image":ImagesPath.categoriesDummy1,
      "title": LocaleKeys.carInsurance.tr(),
      "type":CategoriesTypeEnum.carInsurance,
    },
  ];
  static List<String> dummyTextList =[
    'Dummy 1',
    'Dummy 2',
    'Dummy 3',
    'Dummy 4',
  ];
}
