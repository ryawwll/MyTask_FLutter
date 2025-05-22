import 'dart:convert';

import 'package:equatable/equatable.dart';

class Tugas extends Equatable {
  final int? id;
  final String? judul;
  final String? deskripsi;
  final String? deadline;
  final int? ustadzId;
  final int? isFavorite;
  final String? createdAt;
  final String? updatedAt;

  const Tugas({
    this.id,
    this.judul,
    this.deskripsi,
    this.deadline,
    this.ustadzId,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
  });

  factory Tugas.fromMap(Map<String, dynamic> data) => Tugas(
    id: data['id'] as int?,
    judul: data['judul'] as String?,
    deskripsi: data['deskripsi'] as String?,
    deadline: data['deadline'] as String?,
    ustadzId: data['ustadz_id'] as int?,
    isFavorite: data['is_favorite'] as int?,
    createdAt: data['created_at'] as String?,
    updatedAt: data['updated_at'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'judul': judul,
    'deskripsi': deskripsi,
    'deadline': deadline,
    'ustadz_id': ustadzId,
    'is_favorite': isFavorite,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tugas].
  factory Tugas.fromJson(String data) {
    return Tugas.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tugas] to a JSON string.
  String toJson() => json.encode(toMap());

  Tugas copyWith({
    int? id,
    String? judul,
    String? deskripsi,
    String? deadline,
    int? ustadzId,
    int? isFavorite,
    String? createdAt,
    String? updatedAt,
  }) {
    return Tugas(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      deadline: deadline ?? this.deadline,
      ustadzId: ustadzId ?? this.ustadzId,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      judul,
      deskripsi,
      deadline,
      ustadzId,
      isFavorite,
      createdAt,
      updatedAt,
    ];
  }
}
