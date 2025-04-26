import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafi_user/data/models/car_spare_parts_model/car_spare_part_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CarSparePartModel> cartList = [];

  void addItemToCart(CarSparePartModel item) {
    if (cartList.any((element) => element.id == item.id)) {
      cartList.firstWhere((element) => element.id == item.id).counter++;
    } else {
      _changeAddedToCartValue(item);
      cartList.add(item);
    }
    emit(AddItemToCartState());
  }

  void _changeAddedToCartValue(CarSparePartModel cartItem) {
    cartItem.addedToCart = true;
  }

  void increaseItemCount(CarSparePartModel item) {
    if (cartList.any((element) => element.id == item.id)) {
      cartList.firstWhere((element) => element.id == item.id).counter++;
      emit(IncreaseItemCountState());
    }
  }

  void decreaseItemCount(CarSparePartModel item) {
    if (cartList.any((element) => element.id == item.id)) {
      cartList.firstWhere((element) => element.id == item.id).counter--;
      emit(DecreaseItemCountState());
    }
  }

  void removeItemFromCart(CarSparePartModel removedItem) {
    cartList.removeWhere((item) => item.id == removedItem.id);
    emit(RemoveItemFromCartState());
  }
}
