import 'package:equatable/equatable.dart';

class AddCarParameters extends Equatable {
  final String carTypeId;
  final String? carUserId;
  final String carModelId;
  final String year;
  final String structureNumber;

  const AddCarParameters({
    required this.carTypeId,
    required this.carModelId,
     this.carUserId,
    required this.year,
    required this.structureNumber,
  });

  Map<String, dynamic> toMap() => {
        "car_type_id": carModelId,
        "model_id": carModelId,
        "year": year,
        if(carUserId!=null)"user_car_id": carUserId,
        "structure_num": structureNumber,
      };

  @override
  List<Object?> get props => [
        carTypeId,
        carModelId,
        year,
        structureNumber,
      ];
}
