import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/answer_respon_model.dart';

class AnswerState extends Equatable {
  const AnswerState({
    this.answerResponModel = const AnswerResponModel(),
    this.isLoading = false,
    this.errorMessage = '',
  });

  final AnswerResponModel answerResponModel;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [answerResponModel, isLoading, errorMessage];
  AnswerState copyWith({
    AnswerResponModel? answerResponModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AnswerState(
      answerResponModel: answerResponModel ?? this.answerResponModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

