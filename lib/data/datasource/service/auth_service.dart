import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/model/register_respon_model/register_respon_model.dart';

class AuthService {
  final Dio _dio = Dio();

  AuthService() {
    _dio.options.baseUrl = 'https://mytask.ukasyaaah.my.id/api';
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Either<String, RegisterResponModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _dio.post(
        '/user/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      final registerResponse = RegisterResponModel.fromMap(response.data);
      print(registerResponse.toString());
      return Right(registerResponse);
    } on DioException catch (e) {
      print(e.response?.toString());
      print(e.message);
      if (e.response != null) {
        return Left(e.response?.data['message'] ?? 'Registration failed');
      } else {
        return Left(e.message ?? 'Network error');
      }
    } catch (e) {
      print(e.toString());
      return Left('An unexpected error occurred');
    }
  }
}
