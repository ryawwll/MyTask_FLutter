import 'dart:convert';

import 'package:equatable/equatable.dart';

class AnswerResponModel extends Equatable {
  final String? tugasId;
  final String? isiJawaban;
  final int? siswaId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  const AnswerResponModel({
    this.tugasId,
    this.isiJawaban,
    this.siswaId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory AnswerResponModel.fromMap(Map<String, dynamic> data) {
    return AnswerResponModel(
      tugasId: data['tugas_id'] as String?,
      isiJawaban: data['isi_jawaban'] as String?,
      siswaId: data['siswa_id'] as int?,
      updatedAt: data['updated_at'] as String?,
      createdAt: data['created_at'] as String?,
      id: data['id'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
    'tugas_id': tugasId,
    'isi_jawaban': isiJawaban,
    'siswa_id': siswaId,
    'updated_at': updatedAt,
    'created_at': createdAt,
    'id': id,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnswerResponModel].
  factory AnswerResponModel.fromJson(String data) {
    return AnswerResponModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnswerResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AnswerResponModel copyWith({
    String? tugasId,
    String? isiJawaban,
    int? siswaId,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    return AnswerResponModel(
      tugasId: tugasId ?? this.tugasId,
      isiJawaban: isiJawaban ?? this.isiJawaban,
      siswaId: siswaId ?? this.siswaId,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [tugasId, isiJawaban, siswaId, updatedAt, createdAt, id];
  }
}
