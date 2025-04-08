import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/remote_data_source/car_spare_parts_remote_data_source.dart';
import '../../../data/models/car_spare_parts_model/car_spare_part_model.dart';

part 'car_spare_parts_state.dart';

class CarSparePartsCubit extends Cubit<CarSparePartsState> {
  final CarSparePartsRemoteDataSource _dataSource;
  static CarSparePartsCubit get(context) =>BlocProvider.of(context);
  CarSparePartsCubit(this._dataSource) : super(CarSparePartsInitial());
  List<CarSparePartModel> sparePartsList = [];
  Future<void> getCarSpareParts() async {
    emit(GetCarSparePartsLoading());
    final result = await _dataSource.getCarSparePartsProducts();
    result.fold(
      (error) => emit(GetCarSparePartsError(message: error.baseErrorModel.message)),
      (data) {
        sparePartsList = data.data??[];
        emit(GetCarSparePartsLoaded(data: data));
      },
    );
  }

  Future<void> getSparePartDetails(int id) async {
    emit(GetSparePartDetailsLoading());
    final result = await _dataSource.getSparePartDetails(id: id);
    result.fold(
      (error) => emit(GetSparePartDetailsError(message: error.baseErrorModel.message)),
      (data) => emit(GetSparePartDetailsLoaded(data: data)),
    );
  }
}
