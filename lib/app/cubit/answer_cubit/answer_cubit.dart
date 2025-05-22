import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/answer_cubit/answer_state.dart';
import 'package:lapanganku/data/datasource/service/answer_service.dart';
import 'package:lapanganku/data/model/answer_respon_model/answer_respon_model.dart';

class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit() : super(AnswerState());

  Future<void> submitAnswer({
    required String tugas,
    required String jawaban,
  }) async {
    emit(state.copyWith(isLoading: true));

    var answer = await AnswerService().submitAnswer(
      tugas: tugas,
      jawaban: jawaban,
    );

    answer.fold(
      (left) => emit(state.copyWith(errorMessage: left, isLoading: false)),
      (right) {
        emit(
          state.copyWith(
            answerResponModel: right,
            isLoading: false,
            isSuccess: true,
          ),
        );
      },
    );
  }
}
