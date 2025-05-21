import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/cubit/get_jawaban_state.dart';
import 'package:lapanganku/data/datasource/service/get_jawban_service.dart';
import 'package:lapanganku/data/model/get_jawaban_respon_model/get_jawaban_respon_model.dart';

class GetJawabanCubit extends Cubit<GetJawabanState> {
  GetJawabanCubit() : super(GetJawabanState());

  Future<void> getJawaban({required String tugasId}) async {
    emit(state.copyWith(isLoading: true));

    // Simulate a network call
    var result = await GetJawbanService().getJawaban(tugasId: tugasId, jawaban: '');
    result.fold(
      (left) => emit(state.copyWith(errorMessage: left, isLoading: false)),
      (right) {
        emit(state.copyWith(getJawabanResponModel: right, isLoading: false));
      },
    );

    // Simulate a successful response
    var getJawabanResponModel = GetJawabanResponModel();

    emit(
      state.copyWith(
        getJawabanResponModel: getJawabanResponModel,
        isLoading: false,
      ),
    );
  }
}
