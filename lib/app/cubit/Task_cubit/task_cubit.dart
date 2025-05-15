import 'package:bloc/bloc.dart';
import 'package:lapanganku/app/cubit/Task_cubit/task_state.dart';
import 'package:lapanganku/data/datasource/service/task_service.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState());

  Future<void> getAllTask() async {
    emit(state.copyWith(isLoading: true));

    var data = await TaskService().getAllTask();

    data.fold(
      (left) {
        emit(state.copyWith(error: left));
      },
      (right) {
        var reversedData = right.reversed;
        var data = reversedData.toList();
        emit(state.copyWith(taskList: data));
      },
    );

    emit(state.copyWith(isLoading: false));
  }
}
