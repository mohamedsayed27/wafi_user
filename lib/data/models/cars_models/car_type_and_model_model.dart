import 'package:equatable/equatable.dart';

class CarTypeAndModelModels extends Equatable {
  final int? id;
  final String? image;
  final String? nameAr;
  final String? nameEn;
  final int? active;
  final String? createdAt;
  final String? title;
  final String? imageUrl;

  const CarTypeAndModelModels({
    this.id,
    this.image,
    this.nameAr,
    this.nameEn,
    this.active,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  factory CarTypeAndModelModels.fromJson(Map<String, dynamic> json) {
    return CarTypeAndModelModels(
      id: json['id'] as int?,
      image: json['image'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name_ar': nameAr,
      'name_en': nameEn,
      'active': active,
      'created_at': createdAt,
      'title': title,
      'image_url': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
    id,
    image,
    nameAr,
    nameEn,
    active,
    createdAt,
    title,
    imageUrl,
  ];
}
