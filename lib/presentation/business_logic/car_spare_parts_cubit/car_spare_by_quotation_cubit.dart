import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../core/parameters/spare_by_quotation_parameters.dart';
import '../../../data/data_source/remote_data_source/car_spare_parts_remote_data_source.dart';

part 'car_spare_by_quotation_state.dart';

class CarSpareByQuotationCubit extends Cubit<CarSpareByQuotationState> {
  final CarSparePartsRemoteDataSource _dataSource;
  static CarSpareByQuotationCubit get(context) => BlocProvider.of(context);
  CarSpareByQuotationCubit(this._dataSource) : super(CarSpareByQuotationInitial());
  List<File> imagesList = [];
  final ImagePicker _picker = ImagePicker();
  void sendQuotationOrder({required SpareByQuotationParameters parameters}) async {
    emit(SendQuotationOrderLoading());
    final response = await _dataSource.sendQuotationRequest(
      parameters: parameters,
    );
    response.fold(
      (l) {
        emit(SendQuotationOrderError(error: l.baseErrorModel.message));
      },
      (r) {
        emit(SendQuotationOrderSuccess(baseResponseModel: r));
      },
    );
  }

  void pickUpObjectImages() async {
    emit(PickImagesLoading());
    await _picker.pickMultiImage().then((value) {
      imagesList.addAll(value.map((element) => File(element.path)).toList());
      emit(PickImagesSuccess());
    }).catchError((error) {
      emit(PickImagesError(error: error.toString()));
    });
  }

  void removeImage(File image) {
    imagesList.remove(image);
    emit(ImageRemoved());
  }
}
