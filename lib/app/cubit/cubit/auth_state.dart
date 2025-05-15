import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/login_respon_model/login_respon_model.dart';
import 'package:lapanganku/data/model/register_respon_model/register_respon_model.dart';

class AuthState extends Equatable {
  const AuthState({
    this.registerResponModel = const RegisterResponModel(),
    this.loginResponModel = const LoginResponModel(),
    this.isLoading = false,
    this.errorMessage = '',
  });

  final RegisterResponModel registerResponModel;
  final LoginResponModel loginResponModel;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [registerResponModel, loginResponModel, isLoading, errorMessage];

  AuthState copyWith({
    RegisterResponModel? registerResponModel,
    LoginResponModel? loginResponModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      registerResponModel: registerResponModel ?? this.registerResponModel,
      loginResponModel: loginResponModel ?? this.loginResponModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
