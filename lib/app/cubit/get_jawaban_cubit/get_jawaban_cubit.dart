import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/get_jawaban_cubit/get_jawaban_state.dart';
import 'package:lapanganku/data/datasource/service/get_jawban_service.dart';

class GetJawabanCubit extends Cubit<GetJawabanState> {
  GetJawabanCubit() : super(GetJawabanState());

  Future<void> getJawaban() async {
    emit(state.copyWith(isLoading: true));

    // Simulate a network call
    var result = await GetJawbanService().getJawaban();
    result.fold(
      (left) => emit(state.copyWith(errorMessage: left, isLoading: false)),
      (right) {
        emit(state.copyWith(getJawabanResponModel: right, isLoading: false));
      },
    );
  }
}
