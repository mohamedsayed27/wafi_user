import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafi_user/data/data_source/remote_data_source/profile_remote_data_source.dart';
import 'package:wafi_user/data/models/profile_model/user_data_model.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileDataSource _profileDataSource;

  ProfileCubit(this._profileDataSource) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserDataModel? userDataModel;
  Future<void> fetchProfile() async {
    emit(FetchUserDataLoading());
    final profile = await _profileDataSource.getProfile();
    profile.fold((l) {
      emit(FetchUserDataError(error: l.baseErrorModel.message));
    }, (r) {
      userDataModel = r.data;
      emit(FetchUserDataSuccess(userDataModel: r.data!));
    });
  }
}
