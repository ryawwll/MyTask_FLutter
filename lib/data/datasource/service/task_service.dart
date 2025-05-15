import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';
import 'package:lapanganku/data/model/task_model/task_model.dart';

class TaskService {
  final dio = Dio(
    BaseOptions(
      baseUrl: ' https://mytask.ukasyaaah.my.id/api/user',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {'Authorization' : 'bearer ${LocalStrorage.getToken()}'},
    ),
  );

  Future<Either<String, List<TaskModel>>> getAllTask() async {
    try {
      var response = await dio.get('/task');

      var data = (response.data['data'] as List)
          .map((e) => TaskModel.fromMap(e))
          .toList();

      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
