import 'package:equatable/equatable.dart';
import 'package:lapanganku/data/model/task_model/task_model.dart';

class TaskState extends Equatable {
  const TaskState({
    this.taskList = const [],
    this.isLoading = false,
    this.error = '',
  });

  final List<TaskModel> taskList;
  final bool isLoading;
  final String error;

  @override
  List<Object> get props => [
    taskList,
    isLoading,
    error,
  ];

  TaskState copyWith({
    List<TaskModel>? taskList,
    bool? isLoading,
    String? error,
  }) {
    return TaskState(
      taskList: taskList ?? this.taskList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
