part of 'car_spare_by_quotation_cubit.dart';

sealed class CarSpareByQuotationState {}

final class CarSpareByQuotationInitial extends CarSpareByQuotationState {}

final class SendQuotationOrderLoading extends CarSpareByQuotationState {}

final class SendQuotationOrderSuccess extends CarSpareByQuotationState {
  final BaseResponseModel baseResponseModel;

  SendQuotationOrderSuccess({required this.baseResponseModel});
}

final class SendQuotationOrderError extends CarSpareByQuotationState {
  final String error;

  SendQuotationOrderError({required this.error});
}

final class PickImagesLoading extends CarSpareByQuotationState {}

final class PickImagesSuccess extends CarSpareByQuotationState {}

final class ImageRemoved extends CarSpareByQuotationState {}

final class PickImagesError extends CarSpareByQuotationState {
  final String error;

  PickImagesError({required this.error});
}
