import 'package:flutter_bloc/flutter_bloc.dart';

part 'rent_car_states.dart';

class RentCarCubit extends Cubit<RentCarStates> {
  RentCarCubit() : super(RentCarInitialState());
}
