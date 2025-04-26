part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class AddItemToCartState extends CartState {}

final class RemoveItemFromCartState extends CartState {}

final class IncreaseItemCountState extends CartState {}

final class DecreaseItemCountState extends CartState {}
