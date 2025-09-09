import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wafi_user/data/data_source/remote_data_source/profile_remote_data_source.dart';
import 'package:wafi_user/data/models/profile_model/user_data_model.dart';
import 'package:wafi_user/data/models/profile_model/user_data_params.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileDataSource _profileDataSource;

  UpdateProfileCubit(this._profileDataSource) : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  late final TextEditingController emailController;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  final formKey = GlobalKey<FormState>();
  UserDataModel? userDataModel;
  final ImagePicker _picker = ImagePicker();

  File? image;

  void pickUpImages() async {
    emit(PickImageLoading());
    await _picker.pickImage(source: ImageSource.gallery).then((value) {
      image = File(value!.path);
      emit(PickImageSuccess());
    }).catchError((error) {
      emit(PickImageError(error: error.toString()));
    });
  }

  void initData({UserDataModel? userDataModel}) {
    this.userDataModel = userDataModel;
    initControllers(userDataModel: userDataModel);
  }

  void initControllers({UserDataModel? userDataModel}) {
    emailController = TextEditingController(text: userDataModel?.email ?? "");
    nameController = TextEditingController(text: userDataModel?.name ?? "");
    phoneController = TextEditingController(text: userDataModel?.phone ?? "");
  }

  void isDataChanged() {
    emit(ChangeProfileData(
        isDataChanged: (emailController.text != (userDataModel?.email ?? "") ||
                nameController.text != (userDataModel?.name ?? "") ||
                phoneController.text != (userDataModel?.phone ?? "")) ||
            image != null));
  }

  Future<void> updateProfile(UserDataParams params) async {
    try {
      emit(UpdateUserDataLoading());
      final result = await _profileDataSource.update(params: params);
      result.fold(
        (l) {},
        (r) {
          emit(UpdateUserDataSuccess(userDataModel: r));
        },
      );
    } catch (e) {
      emit(
        UpdateUserDataError(error: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
