import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';
import 'package:lapanganku/data/model/answer_respon_model/answer_respon_model.dart';

class AnswerService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mytask.ukasyaaah.my.id/api/user',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Authorization': 'Bearer ${LocalStrorage().getToken()}',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Either<String, AnswerResponModel>> getAnswer({
    required String tugas,
    required String jawaban,
  }) async {
    try {
      final response = await _dio.post(
        '/jawaban',
        data: {"tugas_id": tugas, "jawaban": jawaban},
      );
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.response?.data['message'] ?? 'Failed to fetch answer');
      } else {
        return Left(e.message ?? 'Network error');
      }
    } catch (e) {
      return Left('An unexpected error occurred');
    }
  }
}
