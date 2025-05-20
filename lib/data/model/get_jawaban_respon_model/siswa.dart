import 'dart:convert';

import 'package:equatable/equatable.dart';

class Siswa extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? role;
	final dynamic profilePhoto;
	final String? createdAt;
	final String? updatedAt;

	const Siswa({
		this.id, 
		this.name, 
		this.email, 
		this.role, 
		this.profilePhoto, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Siswa.fromMap(Map<String, dynamic> data) => Siswa(
				id: data['id'] as int?,
				name: data['name'] as String?,
				email: data['email'] as String?,
				role: data['role'] as String?,
				profilePhoto: data['profile_photo'] as dynamic,
				createdAt: data['created_at'] as String?,
				updatedAt: data['updated_at'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'name': name,
				'email': email,
				'role': role,
				'profile_photo': profilePhoto,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Siswa].
	factory Siswa.fromJson(String data) {
		return Siswa.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Siswa] to a JSON string.
	String toJson() => json.encode(toMap());

	Siswa copyWith({
		int? id,
		String? name,
		String? email,
		String? role,
		dynamic profilePhoto,
		String? createdAt,
		String? updatedAt,
	}) {
		return Siswa(
			id: id ?? this.id,
			name: name ?? this.name,
			email: email ?? this.email,
			role: role ?? this.role,
			profilePhoto: profilePhoto ?? this.profilePhoto,
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
				name,
				email,
				role,
				profilePhoto,
				createdAt,
				updatedAt,
		];
	}
}
