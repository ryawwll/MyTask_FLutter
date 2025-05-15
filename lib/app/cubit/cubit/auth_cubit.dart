import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/cubit/auth_state.dart';
import 'package:lapanganku/data/datasource/service/auth_service.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  Future<void> doRegister({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    emit(state.copyWith(isLoading: true));

    var data = await AuthService().register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: password_confirmation,
    );

    data.fold((left) => emit(state.copyWith(errorMessage: left)), (right) {
      emit(state.copyWith(registerResponModel: right));
    });

    emit(state.copyWith(isLoading: false));
  }

  Future<void> doLogin({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));

    var data = await AuthService().login(email: email, password: password);

    data.fold((left) => emit(state.copyWith(errorMessage: left)), (right) {
      emit(state.copyWith(loginResponModel: right));
      print('token from state : ${state.loginResponModel.token}');
      LocalStrorage.saveToken(right.token ?? '');
    });   

    emit(state.copyWith(isLoading: false));
  }
}
