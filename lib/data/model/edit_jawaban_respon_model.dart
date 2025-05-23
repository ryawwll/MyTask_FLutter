import 'dart:convert';

import 'package:equatable/equatable.dart';

class EditJawabanResponModel extends Equatable {
  final int? id;
  final int? tugasId;
  final int? siswaId;
  final String? isiJawaban;
  final String? createdAt;
  final String? updatedAt;

  const EditJawabanResponModel({
    this.id,
    this.tugasId,
    this.siswaId,
    this.isiJawaban,
    this.createdAt,
    this.updatedAt,
  });

  factory EditJawabanResponModel.fromMap(Map<String, dynamic> data) {
    return EditJawabanResponModel(
      id: data['id'] as int?,
      tugasId: data['tugas_id'] as int?,
      siswaId: data['siswa_id'] as int?,
      isiJawaban: data['isi_jawaban'] as String?,
      createdAt: data['created_at'] as String?,
      updatedAt: data['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'tugas_id': tugasId,
    'siswa_id': siswaId,
    'isi_jawaban': isiJawaban,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EditJawabanResponModel].
  factory EditJawabanResponModel.fromJson(String data) {
    return EditJawabanResponModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [EditJawabanResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EditJawabanResponModel copyWith({
    int? id,
    int? tugasId,
    int? siswaId,
    String? isiJawaban,
    String? createdAt,
    String? updatedAt,
  }) {
    return EditJawabanResponModel(
      id: id ?? this.id,
      tugasId: tugasId ?? this.tugasId,
      siswaId: siswaId ?? this.siswaId,
      isiJawaban: isiJawaban ?? this.isiJawaban,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, tugasId, siswaId, isiJawaban, createdAt, updatedAt];
  }
}
