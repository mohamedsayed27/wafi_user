import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafi_user/core/parameters/add_user_car_parameters.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../data/data_source/remote_data_source/cars_remote_data_source.dart';
import '../../../data/models/cars_models/car_type_and_model_model.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  CarsCubit(this._carsRemoteDataSource) : super(CarsInitial());

  final CarsRemoteDataSource _carsRemoteDataSource;

  static CarsCubit get(context) => BlocProvider.of(context);

  CarTypeAndModelModels? carType;

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

  void getCarModels() async {
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

  void getCarTypes() async {
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

  void addUserCar({
    required AddCarParameters addCarParameters,
  }) async {
    emit(AddUserCarLoading());
    final response = await _carsRemoteDataSource.addUserCar(
      addCarParameters: addCarParameters,
    );
    print(response);
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

  @override
  Future<void> close() {
    print("closed");
    return super.close();
  }
}
