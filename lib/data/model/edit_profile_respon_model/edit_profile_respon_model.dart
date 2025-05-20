import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class EditProfileResponModel extends Equatable {
  final String? message;
  final User? user;

  const EditProfileResponModel({this.message, this.user});

  factory EditProfileResponModel.fromMap(Map<String, dynamic> data) {
    return EditProfileResponModel(
      message: data['message'] as String?,
      user:
          data['user'] == null
              ? null
              : User.fromMap(data['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {'message': message, 'user': user?.toMap()};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EditProfileResponModel].
  factory EditProfileResponModel.fromJson(String data) {
    return EditProfileResponModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [EditProfileResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EditProfileResponModel copyWith({String? message, User? user}) {
    return EditProfileResponModel(
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, user];
}
