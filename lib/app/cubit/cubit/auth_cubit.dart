import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/cubit/auth_state.dart';
import 'package:lapanganku/data/datasource/service/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  Future<void> doRegister ({
   required String name,
   required String email,
   required String password,
   required String password_confirmation,
  }) async {
    emit(state.copyWith(isLoading: true));

    var data = await AuthService().register(
      name: 'Upin',
      email: 'Upin@gmail.com',
      password: 'Upin12345',
      password_confirmation: 'Upin12345',
    );

    data.fold((left) => emit(state.copyWith(errorMessage: left)), (right) {
      emit(state.copyWith(registerResponModel: right));
    });

    emit(state.copyWith(isLoading: false));
  }
}
