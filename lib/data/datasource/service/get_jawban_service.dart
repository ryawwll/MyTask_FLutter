import 'dart:developer';

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

  Future<Either<String, List<GetJawabanResponModel>>> getJawaban() async {
    try {
      var response = await dio.get('/jawaban');
      var result =
          (response.data as List)
              .map((item) => GetJawabanResponModel.fromMap(item))
              .toList();
      log(result.toString());

      return Right(result);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}
