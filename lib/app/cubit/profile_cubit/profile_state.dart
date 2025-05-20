import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/edit_profile_respon_model/edit_profile_respon_model.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.editProfileResponModel = const EditProfileResponModel(),
    this.errorMessage = '',
    this.isLoading = false,
  });

  final EditProfileResponModel editProfileResponModel;
  final String errorMessage;
  final bool isLoading;

  @override
  List<Object> get props => [editProfileResponModel, errorMessage, isLoading];
  ProfileState copyWith({
    EditProfileResponModel? editProfileResponModel,
    String? errorMessage,
    bool? isLoading,
  }) {
    return ProfileState(
      editProfileResponModel: editProfileResponModel ?? this.editProfileResponModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
