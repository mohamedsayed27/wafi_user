import 'package:equatable/equatable.dart';

class CartOrderParameters extends Equatable {
  final String orderDate;
  final String orderTime;
  final String addressId;

  const CartOrderParameters({
    required this.orderDate,
    required this.orderTime,
    required this.addressId,
  });

  @override
  List<Object?> get props => [];
}
