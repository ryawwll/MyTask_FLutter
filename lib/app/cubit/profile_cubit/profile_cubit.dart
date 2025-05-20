import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/profile_cubit/profile_state.dart';
import 'package:lapanganku/data/datasource/editProfil_service.dart';
import 'package:lapanganku/data/model/edit_profile_respon_model/edit_profile_respon_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> editProfile({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(state.copyWith(isLoading: true));

    // Simulate a network call
    var result = await EditprofilService().editProfile(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    result.fold(
      (left) {
        emit(state.copyWith(
          errorMessage: left,
          isLoading: false,
        ));
      },
      (right) {
        emit(state.copyWith(
          editProfileResponModel: EditProfileResponModel(),
          isLoading: false,
        ));
      },
    );

    // Simulate a successful response
    emit(
      state.copyWith(
        editProfileResponModel: EditProfileResponModel(),
        isLoading: false,
      ),
    );
  }
}
