import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';

import '../app_theme/app_colors.dart';
import '../enums/categories_type_enum.dart';

class DummyData {
  static List<Map<String, dynamic>> categoriesList =[
    {
      "image":ImagesPath.categoriesDummy2,
      "title": "Car Service & Maintenance",
      "type":CategoriesTypeEnum.carServices,
    },
    {
      "image":ImagesPath.categoriesDummy3,
      "title": "Car Spare Parts",
      "type":CategoriesTypeEnum.carSpareParts,
    },
    {
      "image":ImagesPath.categoriesDummy4,
      "title": "Car Rental",
      "type":CategoriesTypeEnum.carRental,
    },
    {
      "image":ImagesPath.categoriesDummy1,
      "title": "Car Insurance",
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
