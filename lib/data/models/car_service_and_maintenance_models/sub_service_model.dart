import 'package:equatable/equatable.dart';

class SubServiceModel extends Equatable {
  final int? id;
  final int? sectionId;
  final String? titleAr;
  final String? titleEn;
  final int? price;
  final int? active;
  final String? createdAt;
  final String? title;
  final String? titleWeb;

  const SubServiceModel({
    this.id,
    this.sectionId,
    this.titleAr,
    this.titleEn,
    this.price,
    this.active,
    this.createdAt,
    this.title,
    this.titleWeb,
  });

  factory SubServiceModel.fromJson(Map<String, dynamic> json) {
    return SubServiceModel(
      id: json['id'] as int?,
      sectionId: json['section_id'] as int?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      price: json['price'] as int?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      title: json['title'] as String?,
      titleWeb: json['title_web'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section_id': sectionId,
      'title_ar': titleAr,
      'title_en': titleEn,
      'price': price,
      'active': active,
      'created_at': createdAt,
      'title': title,
      'title_web': titleWeb,
    };
  }

  @override
  List<Object?> get props => [
    id,
    sectionId,
    titleAr,
    titleEn,
    price,
    active,
    createdAt,
    title,
    titleWeb,
  ];
}
