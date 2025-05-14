import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/register_respon_model/register_respon_model.dart';

class AuthState extends Equatable {
  const AuthState({
    this.registerResponModel = const RegisterResponModel(),
    this.isLoading = false,
    this.errorMessage = '',
  });

  final RegisterResponModel registerResponModel;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [registerResponModel, isLoading, errorMessage];

  AuthState copyWith({
    RegisterResponModel? registerResponModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      registerResponModel: registerResponModel ?? this.registerResponModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
