import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:lapanganku/data/datasource/service/local_storage/local_strorage.dart';
import 'package:lapanganku/data/model/get_jawaban_respon_model/get_jawaban_respon_model.dart';

class GetJawbanService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://mytask.ukasyaaah.my.id/api/user',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Authorization': 'Bearer ${LocalStrorage().getToken()}'},
    ),
  );

  Future<Either<String, GetJawabanResponModel>> getJawaban({
    required String tugasId,
    required String jawaban,
  }) async {
    try {
      var response = await dio.post(
        '/jawaban',
        data: {
          'tugas_id': tugasId,
          'isi_jawaban': jawaban,
        },
      );

      return Right(response.data['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}