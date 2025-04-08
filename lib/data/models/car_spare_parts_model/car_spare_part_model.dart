import 'package:equatable/equatable.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

class GetCarSparePartsProducts
    extends BaseResponseModel<List<CarSparePartModel>> {
  const GetCarSparePartsProducts({
    required super.message,
    required super.status,
    super.data,
  });

  factory GetCarSparePartsProducts.fromJson(Map<String, dynamic> json) {
    List<dynamic> list =
        json["data"] as List<dynamic>;
    return GetCarSparePartsProducts(
      message: json['msg'],
      status: json['status'],
      data: list.map((element) => CarSparePartModel.fromJson(element)).toList(),
    );
  }
}

class CarSparePartModel extends Equatable {
  final int? id;
  final int? providerId;
  final String? titleAr;
  final String? titleEn;
  final String? pieceNum;
  final int? price;
  final String? image;
  final int? active;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;
  final String? logoUrl;
  final String? carTypeName;
  final String? modelName;
  final String? title;
  final String? titleWeb;
  final String? description;
  final String? descriptionWeb;
  int counter;

  CarSparePartModel({
    this.id,
    this.providerId,
    this.titleAr,
    this.titleEn,
    this.pieceNum,
    this.price,
    this.image,
    this.counter = 0,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.logoUrl,
    this.carTypeName,
    this.modelName,
    this.title,
    this.titleWeb,
    this.description,
    this.descriptionWeb,
  });

  factory CarSparePartModel.fromJson(Map<String, dynamic> json) {
    return CarSparePartModel(
      id: json['id'] as int?,
      providerId: json['provider_id'] as int?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      pieceNum: json['piece_num'] as String?,
      price: json['price'] as int?,
      image: json['image'] as String?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      imageUrl: json['image_url'] as String?,
      logoUrl: json['logo_url'] as String?,
      carTypeName: json['car_type_name'] as String?,
      modelName: json['model_name'] as String?,
      title: json['title'] as String?,
      titleWeb: json['title_web'] as String?,
      description: json['description'] as String?,
      descriptionWeb: json['description_web'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'provider_id': providerId,
      'title_ar': titleAr,
      'title_en': titleEn,
      'piece_num': pieceNum,
      'price': price,
      'image': image,
      'active': active,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
      'logo_url': logoUrl,
      'car_type_name': carTypeName,
      'model_name': modelName,
      'title': title,
      'title_web': titleWeb,
      'description': description,
      'description_web': descriptionWeb,
    };
  }

  @override
  List<Object?> get props => [
        id,
        providerId,
        titleAr,
        titleEn,
        pieceNum,
        price,
        image,
        active,
        createdAt,
        updatedAt,
        imageUrl,
        logoUrl,
        carTypeName,
        modelName,
        title,
        titleWeb,
        description,
        descriptionWeb,
      ];
}
