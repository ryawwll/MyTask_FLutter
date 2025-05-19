import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/cubit/answer_state.dart';
import 'package:lapanganku/data/datasource/service/answer_srevice.dart';
import 'package:lapanganku/data/model/answer_respon_model.dart';
class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit() : super(AnswerState());

  Future<void> submitAnswer(String tugas, String jawaban) async {
    emit(state.copyWith(isLoading: true));

    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));

  var answer = await AnswerSrevice().getAnswer(
      tugas: tugas,
      jawaban: jawaban,
    );

    answer.fold(
      (left) => emit(state.copyWith(errorMessage: left, isLoading: false)),
      (right) {
        emit(state.copyWith(answerResponModel: right, isLoading: false));
      },
    );
    // Simulate a successful response
    final answerResponModel = AnswerResponModel(
      tugasId: tugas,
      isiJawaban: jawaban,
    );

    emit(state.copyWith(answerResponModel: answerResponModel, isLoading: false));
  }
}
