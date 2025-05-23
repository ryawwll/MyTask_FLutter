import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';
import 'package:lapanganku/data/model/login_respon_model/login_respon_model.dart';
import 'package:lapanganku/data/model/logout_respon_model.dart';
import 'package:lapanganku/data/model/register_respon_model/register_respon_model.dart';
import 'package:lapanganku/data/model/user_respon_model/user_respon_model.dart';

class AuthService {
  final Dio _dio = Dio();

  AuthService() {
    _dio.options.baseUrl = 'https://mytask.ukasyaaah.my.id/api/user';
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
        '/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      final registerResponse = RegisterResponModel.fromMap(response.data);
      return Right(registerResponse);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.response?.data['message'] ?? 'Registration failed');
      } else {
        return Left(e.message ?? 'Network error');
      }
    } catch (e) {
      return Left('An unexpected error occurred');
    }
  }

  Future<Either<String, LoginResponModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {"email": email, "password": password},
      );

      final loginResponse = LoginResponModel.fromMap(response.data);
      return Right(loginResponse);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.response?.data['message'] ?? 'Login failed');
      } else {
        return Left(e.message ?? 'Network error');
      }
    } catch (e) {
      return Left('An unexpected error occurred');
    }
  }

  Future<Either<String, LogoutResponModel>> logout(String token) async {
    try {
      var response = await _dio.post(
        '/logout',
        options: Options(headers: {'Authorization': 'Bearer $token}'}),
      );

      var logoutResponse = LogoutResponModel.fromMap(response.data);
      return Right(logoutResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        var errorResponse = e.response?.data['message'];
        return Left('Error : $errorResponse');
      } else if (e.response?.statusCode == 401) {
        var errorResponse = e.response?.data['message'];
        return Left('Error : $errorResponse');
      } else {
        return Left('Undhandle Error : ${e.message}');
      }
    }
  }

  Future<Either<String, UserResponModel>> getUser() async {
    try {
      final token = await LocalStrorage().getToken();

      var response = await _dio.get(
        '/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      var data = UserResponModel.fromMap(response.data);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
