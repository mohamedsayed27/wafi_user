import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

class UserDataParams {
  final String? name;
  final String? email;
  final String? phone;
  final File? image;

  UserDataParams({
    this.name,
    this.email,
    this.image,
    this.phone,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (image != null)
        'image': MultipartFile.fromBytes(
          image!.readAsBytesSync(),
          filename: '${DateTime.now().millisecondsSinceEpoch}${path.extension(image!.path)}',
        ),
    };
  }
}
