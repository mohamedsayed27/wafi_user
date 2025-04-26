import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/remote_data_source/car_spare_parts_remote_data_source.dart';
import '../../../data/models/car_spare_parts_model/car_spare_part_model.dart';

part 'car_spare_by_parts_state.dart';

class CarSparePartsCubit extends Cubit<CarSparePartsState> {
  final CarSparePartsRemoteDataSource _dataSource;
  static CarSparePartsCubit get(context) => BlocProvider.of(context);
  CarSparePartsCubit(this._dataSource) : super(CarSparePartsInitial());
  List<CarSparePartModel> sparePartsList = [];
  List<CarSparePartModel> _mainSparePartsList = [];
  final TextEditingController searchSparePartController = TextEditingController();
  Future<void> getCarSpareParts() async {
    emit(GetCarSparePartsLoading());
    final result = await _dataSource.getCarSparePartsProducts();
    result.fold(
      (error) => emit(GetCarSparePartsError(message: error.baseErrorModel.message)),
      (data) {
        sparePartsList = data.data ?? [];
        _mainSparePartsList = sparePartsList;
        emit(GetCarSparePartsLoaded(data: data));
      },
    );
  }

  void searchSparePart(String? value) {
    if (value == null) {
      sparePartsList = _mainSparePartsList;
    } else {
      sparePartsList = _mainSparePartsList
          .where((element) => element.title!.contains(value) || element.pieceNum!.contains(value))
          .toList();
    }
    emit(SearchCarSpareParts());
  }

  Future<void> getSparePartDetails(int id) async {
    emit(GetSparePartDetailsLoading());
    final result = await _dataSource.getSparePartDetails(id: id);
    result.fold(
      (error) => emit(GetSparePartDetailsError(message: error.baseErrorModel.message)),
      (data) => emit(GetSparePartDetailsLoaded(data: data)),
    );
  }

  @override
  Future<void> close() {
    searchSparePartController.dispose();
    return super.close();
  }
}
