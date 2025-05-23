import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/answer_respon_model/answer_respon_model.dart';
import 'package:lapanganku/data/model/delete_jawaban_respon_model.dart';
import 'package:lapanganku/data/model/edit_jawaban_respon_model.dart';
import 'package:lapanganku/data/model/get_jawaban_respon_model/get_jawaban_respon_model.dart';

class AnswerState extends Equatable {
  const AnswerState({
    this.answerResponModel = const AnswerResponModel(),
    this.getJawabanResponList = const [],
    this.editJawabanResponModel = const EditJawabanResponModel(),
    this.deleteJawabanResponModel = const DeleteJawabanResponModel(),
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage = '',
  });

  final AnswerResponModel answerResponModel;
  final List<GetJawabanResponModel> getJawabanResponList;
  final EditJawabanResponModel editJawabanResponModel;
  final DeleteJawabanResponModel deleteJawabanResponModel;
  final bool isSuccess;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [
    answerResponModel,
    getJawabanResponList,
    editJawabanResponModel,
    deleteJawabanResponModel,
    isSuccess,
    isLoading,
    errorMessage,
  ];

  AnswerState copyWith({
    AnswerResponModel? answerResponModel,
    List<GetJawabanResponModel>? getJawabanResponList,
    EditJawabanResponModel? editJawabanResponModel,
    DeleteJawabanResponModel? deleteJawabanResponModel,
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AnswerState(
      answerResponModel: answerResponModel ?? this.answerResponModel,
      getJawabanResponList: getJawabanResponList ?? this.getJawabanResponList,
      editJawabanResponModel:
          editJawabanResponModel ?? this.editJawabanResponModel,
      deleteJawabanResponModel:
          deleteJawabanResponModel ?? this.deleteJawabanResponModel,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
