import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/answer_cubit/answer_state.dart';
import 'package:lapanganku/data/datasource/service/answer_service.dart';

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

  Future<void> getJawaban() async {
    emit(state.copyWith(isLoading: true));

    var result = await AnswerService().getJawaban();

    result.fold(
      (left) {
        emit(state.copyWith(errorMessage: left, isLoading: false));
      },
      (right) {
        emit(state.copyWith(getJawabanResponList: right, isLoading: false));
      },
    );
  }

  Future<void> editJawaban({
    required String jawaban,
    required String id,
  }) async {
    emit(state.copyWith(isLoading: true));

    var result = await AnswerService().editJawaban(jawaban: jawaban, id: id);

    result.fold(
      (left) {
        emit(state.copyWith(errorMessage: left, isLoading: false));
      },
      (right) {
        emit(state.copyWith(editJawabanResponModel: right, isLoading: false));
      },
    );
  }

  Future<void> deleteJawaban({required String id}) async {
    emit(state.copyWith(isLoading: true));

    var result = await AnswerService().deleteJawaban(id: id);

    result.fold(
      (left) {
        emit(state.copyWith(errorMessage: left, isLoading: false));
      },
      (right) {
        emit(state.copyWith(deleteJawabanResponModel: right, isLoading: false));
      },
    );
  }
}
