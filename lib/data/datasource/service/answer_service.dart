import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_Storage.dart';
import 'package:lapanganku/data/model/answer_respon_model/answer_respon_model.dart';
import 'package:lapanganku/data/model/delete_jawaban_respon_model.dart';
import 'package:lapanganku/data/model/edit_jawaban_respon_model.dart';
import 'package:lapanganku/data/model/get_jawaban_respon_model/get_jawaban_respon_model.dart';

class AnswerService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mytask.ukasyaaah.my.id/api/user',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Authorization': 'Bearer ${LocalStrorage().getToken()}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Either<String, AnswerResponModel>> submitAnswer({
    required String tugas,
    required String jawaban,
  }) async {
    try {
      final response = await _dio.post(
        '/jawaban',
        data: {"tugas_id": tugas, "isi_jawaban": jawaban},
      );
      log('success: ${response.data}');
      return Right(
        AnswerResponModel.fromMap(response.data),
      );
    } on DioException catch (e) {
      log('error: ${e.response?.data}');
      if (e.response != null) {
        return Left(e.response?.data['message'] ?? 'Failed to fetch answer');
      } else {
        return Left(e.message ?? 'Network error');
      }
    } catch (e) {
      return Left('An unexpected error occurred');
    }
  }

  Future<Either<String, List<GetJawabanResponModel>>> getJawaban() async {
    try {
      var response = await _dio.get('/jawaban');
      var result =
          (response.data as List)
              .map((item) => GetJawabanResponModel.fromMap(item))
              .toList();

      return Right(result);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, EditJawabanResponModel>> editJawaban({
    required String jawaban,
    required String id,
  }) async {
    try {
      final response = await _dio.put(
        '/jawaban/$id',
        data: {'isi_jawaban': jawaban, 'id': id},
      );

      return Right(EditJawabanResponModel.fromMap(response.data));
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, DeleteJawabanResponModel>> deleteJawaban({
    required String id,
  }) async {
    try {
      final response = await _dio.delete('/jawaban/$id');
      return Right(
          DeleteJawabanResponModel.fromMap(response.data));
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}
