import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:equatable/equatable.dart';

import '../enums/yes_no_enum.dart';

class SpareByQuotationParameters extends Equatable {
  final String name;
  final String? partNum;
  final String notes;
  final YesNo used;
  final List<File> images;
  final String addressId;

  const SpareByQuotationParameters({
    required this.name,
    required this.partNum,
    required this.notes,
    required this.used,
    required this.images,
    required this.addressId,
  });
  Future<Map<String, dynamic>> toJson() async {
    final imageFiles = await Future.wait(
      images.map(
        (element) => MultipartFile.fromFile(
          element.path,
          filename: path.basename(element.path),
        ),
      ),
    );

    return {
      'name': name,
      if (partNum != null) 'product_num': partNum,
      'notes': notes,
      'used': used.name,
      'images[]': imageFiles,
      'address_id': addressId,
    };
  }

  @override
  List<Object?> get props => [
        name,
        partNum,
        notes,
        used,
        images,
        addressId,
      ];
}
