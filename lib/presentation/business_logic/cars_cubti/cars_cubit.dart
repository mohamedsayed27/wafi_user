import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafi_user/core/parameters/add_user_car_parameters.dart';
import 'package:wafi_user/data/models/base_response_model.dart';
import 'package:wafi_user/data/models/cars_models/car_model.dart';

import '../../../data/data_source/remote_data_source/cars_remote_data_source.dart';
import '../../../data/models/cars_models/car_type_and_model_model.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  CarsCubit(this._carsRemoteDataSource) : super(CarsInitial());

  final CarsRemoteDataSource _carsRemoteDataSource;

  static CarsCubit get(context) => BlocProvider.of(context);

  CarTypeAndModelModels? carType;

  final TextEditingController controller = TextEditingController();

  void changeCarType(CarTypeAndModelModels? carType) {
    this.carType = carType;
    emit(UpdateDropDownValue());
  }

  CarTypeAndModelModels? carModel;

  void changeCarModel(CarTypeAndModelModels? carModel) {
    this.carModel = carModel;
    emit(UpdateDropDownValue());
  }

  DateTime? dateTime;

  void chooseTime(DateTime? dateTime) {
    this.dateTime = dateTime;
    emit(UpdateDropDownValue());
  }

  List<CarTypeAndModelModels> carModelsList = [];

  Future<void> getCarModels() async {
    emit(GetModelsLoading());
    final response = await _carsRemoteDataSource.getCarModels();
    response.fold(
      (l) {
        emit(GetModelsError());
      },
      (r) {
        carModelsList = r.data ?? [];
        emit(GetModelsSuccess());
      },
    );
  }

  List<CarTypeAndModelModels> carTypesList = [];

  Future<void> getCarTypes() async {
    emit(GetCarTypesLoading());
    final response = await _carsRemoteDataSource.getCarTypes();
    response.fold(
      (l) {
        emit(GetCarTypesError());
      },
      (r) {
        carTypesList = r.data ?? [];
        emit(GetCarTypesSuccess());
      },
    );
  }

  bool? initCarLoading ;
  int? carId ;
  void initProducts(CarModel carModel) async {
    initCarLoading = true;
    emit(InitResLoading());
    try {
      carId = carModel.id;
      dateTime = DateTime(int.parse(carModel.year.toString()));
      this.carModel = carModelsList.firstWhere((element) => element.id == carModel.modelId);
      controller.text = carModel.structureNum.toString();
      carType = carTypesList.firstWhere((element) => element.id == carModel.carTypeId);
      initCarLoading = false;
      emit(InitResSuccess());
    } catch (error) {
      initCarLoading = false;
      emit(InitResError());
    }
  }

  void empty() async {
    dateTime = null;
    carModel = null;
    carId = null;
    carType = null;
    controller.clear();
    initCarLoading = null;
  }

  List<CarModel> carsList = [];

  void getMyCars() async {
    emit(GetMyCarsListLoading());
    final response = await _carsRemoteDataSource.getMyCarsList();
    response.fold(
      (l) {
        emit(GetMyCarsListError());
      },
      (r) {
        carsList = r;
        emit(GetMyCarsListSuccess());
      },
    );
  }

  void addUserCar({
    required AddCarParameters addCarParameters,
  }) async {
    emit(AddUserCarLoading());
    final response = await _carsRemoteDataSource.addUserCar(
      addCarParameters: addCarParameters,
    );
    response.fold(
      (l) {
        emit(AddUserCarError());
      },
      (r) {
        emit(
          AddUserCarSuccess(
            baseResponseModel: r,
          ),
        );
      },
    );
  }

  void updateUserCar({
    required AddCarParameters addCarParameters,
  }) async {
    emit(AddUserCarLoading());
    final response = await _carsRemoteDataSource.updateUserCar(
      addCarParameters: addCarParameters,
    );
    response.fold(
      (l) {
        emit(AddUserCarError());
      },
      (r) {
        getMyCars();
        emit(
          AddUserCarSuccess(
            baseResponseModel: r,
          ),
        );
      },
    );
  }
}
