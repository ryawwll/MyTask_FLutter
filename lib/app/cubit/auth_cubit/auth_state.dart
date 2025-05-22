import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/login_respon_model/login_respon_model.dart';
import 'package:lapanganku/data/model/logout_respon_model.dart';
import 'package:lapanganku/data/model/register_respon_model/register_respon_model.dart';
import 'package:lapanganku/data/model/user_respon_model/user_respon_model.dart';

class AuthState extends Equatable {
  const AuthState({
    this.registerResponModel = const RegisterResponModel(),
    this.loginResponModel = const LoginResponModel(),
    this.logoutResponModel = const LogoutResponModel(),
    this.userResponModel = const UserResponModel(),
    this.isLoading = false,
    this.errorMessage = '',
  });

  final RegisterResponModel registerResponModel;
  final LoginResponModel loginResponModel;
  final LogoutResponModel logoutResponModel;
  final UserResponModel userResponModel;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [
    registerResponModel,
    loginResponModel,
    logoutResponModel,
    userResponModel,
    isLoading,
    errorMessage,
  ];

  AuthState copyWith({
    RegisterResponModel? registerResponModel,
    LoginResponModel? loginResponModel,
    LogoutResponModel? logoutResponModel,
    UserResponModel? userResponModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      registerResponModel: registerResponModel ?? this.registerResponModel,
      loginResponModel: loginResponModel ?? this.loginResponModel,
      logoutResponModel: logoutResponModel ?? this.logoutResponModel,
      userResponModel: userResponModel ?? this.userResponModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
