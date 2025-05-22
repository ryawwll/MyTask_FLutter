import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/get_jawaban_respon_model/get_jawaban_respon_model.dart';

class GetJawabanState extends Equatable {
  const GetJawabanState({
    this.getJawabanResponModel,
    this.isLoading = false,
    this.errorMessage = '',
  });

  final List<GetJawabanResponModel>? getJawabanResponModel;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [
    getJawabanResponModel ?? '',
    isLoading,
    errorMessage,
  ];

  GetJawabanState copyWith({
    List<GetJawabanResponModel>? getJawabanResponModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return GetJawabanState(
      getJawabanResponModel:
          getJawabanResponModel ?? this.getJawabanResponModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
