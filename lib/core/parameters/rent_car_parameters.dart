class RentCarParameters {
  final String? fromData;
  final String? fromTime;
  final String? orderDate;
  final String? orderTime;
  final String? airport;
  final String? carDelivery;
  final String? economical;
  final String? typeCarId;
  final String? modelId;
  final String? addressIdYear;
  final String? payMethod;
  final String? pay;
  final String? transactionId;
  final String? payData;
  final String? providerCarsId;
  final String? typeOfDriver;
  final String? passport;
  final String? driverLicense;
  final String? driverLicenseExpiryDate;
  final String? passportExpiryDate;
  final String? dateOfBirth;
  final String? citizenship;
  final String? nationalId;
  final String? version;
  final String? nationalIdDate;
  final String? driverLicenseExpiry;
  final String? internationalDriverLicenseImage;
  final String? passportFrontImage;
  final String? driverLicenseWithSelfieImage;

  const RentCarParameters({
    required this.fromData,
    required this.fromTime,
    required this.orderDate,
    required this.orderTime,
    required this.airport,
    required this.carDelivery,
    required this.economical,
    required this.typeCarId,
    required this.modelId,
    required this.addressIdYear,
    required this.payMethod,
    required this.pay,
    required this.transactionId,
    required this.payData,
    required this.providerCarsId,
    required this.typeOfDriver,
    required this.passport,
    required this.driverLicense,
    required this.driverLicenseExpiryDate,
    required this.passportExpiryDate,
    required this.dateOfBirth,
    required this.citizenship,
    required this.nationalId,
    required this.version,
    required this.nationalIdDate,
    required this.driverLicenseExpiry,
    required this.internationalDriverLicenseImage,
    required this.passportFrontImage,
    required this.driverLicenseWithSelfieImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'from_data': fromData,
      'from_time': fromTime,
      'order_date': orderDate,
      'order_time': orderTime,
      'airport': airport,
      'car_delivery': carDelivery,
      'economical': economical,
      'type_car_id': typeCarId,
      'model_id': modelId,
      'address_idyear': addressIdYear,
      'pay_method': payMethod,
      'pay': pay,
      'transaction_id': transactionId,
      'pay_data': payData,
      'provider_cars_id': providerCarsId,
      'type_of_driver': typeOfDriver,
      'passport': passport,
      'driver_license': driverLicense,
      'driver_license_expiry_date': driverLicenseExpiryDate,
      'passport_expiry_date': passportExpiryDate,
      'date_of_birth': dateOfBirth,
      'citizenship': citizenship,
      'national_id': nationalId,
      'version': version,
      'national_id_date': nationalIdDate,
      'driver_license_expiry': driverLicenseExpiry,
      'international_driver_license_image': internationalDriverLicenseImage,
      'passport_front_image': passportFrontImage,
      'driver_license_with_selfie_image': driverLicenseWithSelfieImage,
    };
  }
}
