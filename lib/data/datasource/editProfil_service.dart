import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';

class EditprofilService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://mytask.ukasyaaah.my.id/api/user',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {'Authorization': 'Bearer ${LocalStrorage().getToken()}'},
    ),
  );

  Future<Either<String, String>> editProfile({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      var response = await dio.post(
        '/edit-profile',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      return Right(response.data['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}