import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'nilai.dart';
import 'siswa.dart';
import 'tugas.dart';

class GetJawabanResponModel extends Equatable {
  final int? id;
  final int? tugasId;
  final int? siswaId;
  final String? isiJawaban;
  final String? createdAt;
  final String? updatedAt;
  final Tugas? tugas;
  final Siswa? siswa;
  final Nilai? nilai;

  const GetJawabanResponModel({
    this.id,
    this.tugasId,
    this.siswaId,
    this.isiJawaban,
    this.createdAt,
    this.updatedAt,
    this.tugas,
    this.siswa,
    this.nilai,
  });

  factory GetJawabanResponModel.fromMap(Map<String, dynamic> data) {
    return GetJawabanResponModel(
      id: data['id'] as int?,
      tugasId: data['tugas_id'] as int?,
      siswaId: data['siswa_id'] as int?,
      isiJawaban: data['isi_jawaban'] as String?,
      createdAt: data['created_at'] as String?,
      updatedAt: data['updated_at'] as String?,
      tugas:
          data['tugas'] == null
              ? null
              : Tugas.fromMap(data['tugas'] as Map<String, dynamic>),
      siswa:
          data['siswa'] == null
              ? null
              : Siswa.fromMap(data['siswa'] as Map<String, dynamic>),
      nilai:
          data['nilai'] == null
              ? null
              : Nilai.fromMap(data['nilai'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'tugas_id': tugasId,
    'siswa_id': siswaId,
    'isi_jawaban': isiJawaban,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'tugas': tugas?.toMap(),
    'siswa': siswa?.toMap(),
    'nilai': nilai?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetJawabanResponModel].
  factory GetJawabanResponModel.fromJson(String data) {
    return GetJawabanResponModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [GetJawabanResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  GetJawabanResponModel copyWith({
    int? id,
    int? tugasId,
    int? siswaId,
    String? isiJawaban,
    String? createdAt,
    String? updatedAt,
    Tugas? tugas,
    Siswa? siswa,
    Nilai? nilai,
  }) {
    return GetJawabanResponModel(
      id: id ?? this.id,
      tugasId: tugasId ?? this.tugasId,
      siswaId: siswaId ?? this.siswaId,
      isiJawaban: isiJawaban ?? this.isiJawaban,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tugas: tugas ?? this.tugas,
      siswa: siswa ?? this.siswa,
      nilai: nilai ?? this.nilai,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      tugasId,
      siswaId,
      isiJawaban,
      createdAt,
      updatedAt,
      tugas,
      siswa,
      nilai,
    ];
  }
}
