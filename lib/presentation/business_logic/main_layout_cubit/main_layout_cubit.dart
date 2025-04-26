import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_layout_states.dart';

class MainLayoutCubit extends Cubit<MainLayoutStates> {
  MainLayoutCubit() : super(MainLayoutInitialState());

  static MainLayoutCubit get(context) => BlocProvider.of(context);
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    emit(ChangeScreenIndexState());
  }
}
