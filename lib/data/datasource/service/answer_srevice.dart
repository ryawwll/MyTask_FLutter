import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/model/answer_respon_model.dart';

class AnswerSrevice {
  final Dio _dio = Dio();
  AnswerSrevice() {
    _dio.options.baseUrl = 'https://mytask.ukasyaaah.my.id/api/user';
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Either<String, AnswerResponModel>> getAnswer({
    required String tugas,
    required String jawaban,
  }) async {
    try {
      final response = await _dio.post(
        '/tugas/$tugas/answer',
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
