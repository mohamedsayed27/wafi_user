import 'package:equatable/equatable.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

class OtpModel extends BaseResponseModel<OtpDataModel> {
  const OtpModel({
    required super.message,
    required super.status,
    required super.data,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      message: json["msg"],
      status: json["status"],
      data: OtpDataModel.fromJson(
        json["data"],
      ),
    );
  }
}

class OtpDataModel extends Equatable {
  final int? id;
  final String? name;
  final String? type;
  final String? courierOrAgent;
  final String? email;
  final String? countryKey;
  final String? active;
  final String? resetCode;
  final String? phone;
  final String? img;
  final String? createdAt;
  final String? language;
  final int? countryId;
  final int? natId;
  final int? cityId;
  final double? latitude;
  final double? longitude;
  final String? gender;
  final String? birth;
  final int? carTypeId;
  final String? iban;
  final String? idImage;
  final String? idNum;
  final String? idDate;
  final String? carLicenseImage;
  final String? carNumber;
  final int? typeModelId;
  final String? year;
  final String? address;
  final String? commercialImage;
  final String? licenseImage;
  final String? contractLetter;
  final String? code;
  final String? idCard;
  final String? token;
  final int? countWalet;
  final String? addres;
  final String? imageUrl;
  final String? countryName;
  final String? cityName;
  final String? countryNameWeb;
  final String? cityNameWeb;

  const OtpDataModel({
    this.id,
    this.name,
    this.type,
    this.courierOrAgent,
    this.email,
    this.countryKey,
    this.active,
    this.resetCode,
    this.phone,
    this.img,
    this.createdAt,
    this.language,
    this.countryId,
    this.natId,
    this.cityId,
    this.latitude,
    this.longitude,
    this.gender,
    this.birth,
    this.carTypeId,
    this.iban,
    this.idImage,
    this.idNum,
    this.idDate,
    this.carLicenseImage,
    this.carNumber,
    this.typeModelId,
    this.year,
    this.address,
    this.commercialImage,
    this.licenseImage,
    this.contractLetter,
    this.code,
    this.idCard,
    this.token,
    this.countWalet,
    this.addres,
    this.imageUrl,
    this.countryName,
    this.cityName,
    this.countryNameWeb,
    this.cityNameWeb,
  });

  factory OtpDataModel.fromJson(Map<String, dynamic> json) {
    return OtpDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      courierOrAgent: json['courier_or_agent'] as String?,
      email: json['email'] as String?,
      countryKey: json['country_key'] as String?,
      active: json['active'] as String?,
      resetCode: json['reset_code'] as String?,
      phone: json['phone'] as String?,
      img: json['img'] as String?,
      createdAt: json['created_at'] as String?,
      language: json['language'] as String?,
      countryId: json['country_id'] as int?,
      natId: json['nat_id'] as int?,
      cityId: json['city_id'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      birth: json['birth'] as String?,
      carTypeId: json['car_type_id'] as int?,
      iban: json['iban'] as String?,
      idImage: json['id_image'] as String?,
      idNum: json['id_num'] as String?,
      idDate: json['id_date'] as String?,
      carLicenseImage: json['car_license_image'] as String?,
      carNumber: json['car_number'] as String?,
      typeModelId: json['type_model_id'] as int?,
      year: json['year'] as String?,
      address: json['address'] as String?,
      commercialImage: json['commercial_image'] as String?,
      licenseImage: json['license_image'] as String?,
      contractLetter: json['contract_letter'] as String?,
      code: json['code'] as String?,
      idCard: json['id_card'] as String?,
      token: json['token'] as String?,
      countWalet: json['count_walet'] as int?,
      addres: json['addres'] as String?,
      imageUrl: json['image_url'] as String?,
      countryName: json['country_name'] as String?,
      cityName: json['city_name'] as String?,
      countryNameWeb: json['country_name_web'] as String?,
      cityNameWeb: json['city_name_web'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        courierOrAgent,
        email,
        countryKey,
        active,
        resetCode,
        phone,
        img,
        createdAt,
        language,
        countryId,
        natId,
        cityId,
        latitude,
        longitude,
        gender,
        birth,
        carTypeId,
        iban,
        idImage,
        idNum,
        idDate,
        carLicenseImage,
        carNumber,
        typeModelId,
        year,
        address,
        commercialImage,
        licenseImage,
        contractLetter,
        code,
        idCard,
        token,
        countWalet,
        addres,
        imageUrl,
        countryName,
        cityName,
        countryNameWeb,
        cityNameWeb,
      ];
}
