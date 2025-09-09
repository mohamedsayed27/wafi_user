import 'package:equatable/equatable.dart';

class CarServiceModel extends Equatable {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final String? icon;
  final int? active;
  final String? createdAt;
  final String? title;
  final String? titleWeb;
  final String? imageUrl;

  const CarServiceModel({
    this.id,
    this.titleAr,
    this.titleEn,
    this.icon,
    this.active,
    this.createdAt,
    this.title,
    this.titleWeb,
    this.imageUrl,
  });

  factory CarServiceModel.fromJson(Map<String, dynamic> json) {
    return CarServiceModel(
      id: json['id'] as int?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      icon: json['icon'] as String?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      title: json['title'] as String?,
      titleWeb: json['title_web'] as String?,
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_ar': titleAr,
      'title_en': titleEn,
      'icon': icon,
      'active': active,
      'created_at': createdAt,
      'title': title,
      'title_web': titleWeb,
      'image_url': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
        id,
        titleAr,
        titleEn,
        icon,
        active,
        createdAt,
        title,
        titleWeb,
        imageUrl,
      ];
}
