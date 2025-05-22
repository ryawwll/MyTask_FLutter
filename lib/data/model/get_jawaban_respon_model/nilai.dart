import 'dart:convert';

import 'package:equatable/equatable.dart';

class Nilai extends Equatable {
  final int? id;
  final int? jawabanId;
  final int? nilai;
  final String? komentar;
  final int? dinilaiOleh;
  final String? createdAt;
  final String? updatedAt;

  const Nilai({
    this.id,
    this.jawabanId,
    this.nilai,
    this.komentar,
    this.dinilaiOleh,
    this.createdAt,
    this.updatedAt,
  });

  factory Nilai.fromMap(Map<String, dynamic> data) => Nilai(
    id: data['id'] as int?,
    jawabanId: data['jawaban_id'] as int?,
    nilai: data['nilai'] as int?,
    komentar: data['komentar'] as String?,
    dinilaiOleh: data['dinilai_oleh'] as int?,
    createdAt: data['created_at'] as String?,
    updatedAt: data['updated_at'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'jawaban_id': jawabanId,
    'nilai': nilai,
    'komentar': komentar,
    'dinilai_oleh': dinilaiOleh,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Nilai].
  factory Nilai.fromJson(String data) {
    return Nilai.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Nilai] to a JSON string.
  String toJson() => json.encode(toMap());

  Nilai copyWith({
    int? id,
    int? jawabanId,
    int? nilai,
    String? komentar,
    int? dinilaiOleh,
    String? createdAt,
    String? updatedAt,
  }) {
    return Nilai(
      id: id ?? this.id,
      jawabanId: jawabanId ?? this.jawabanId,
      nilai: nilai ?? this.nilai,
      komentar: komentar ?? this.komentar,
      dinilaiOleh: dinilaiOleh ?? this.dinilaiOleh,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, jawabanId, nilai, komentar, dinilaiOleh, createdAt, updatedAt];
  }
}
