import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterResponModel extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final User? user;

  const RegisterResponModel({this.accessToken, this.tokenType, this.user});

  factory RegisterResponModel.fromMap(Map<String, dynamic> data) {
    return RegisterResponModel(
      accessToken: data['access_token'] as String?,
      tokenType: data['token_type'] as String?,
      user:
          data['user'] == null
              ? null
              : User.fromMap(data['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
    'access_token': accessToken,
    'token_type': tokenType,
    'user': user?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterResponModel].
  factory RegisterResponModel.fromJson(String data) {
    return RegisterResponModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  RegisterResponModel copyWith({
    String? accessToken,
    String? tokenType,
    User? user,
  }) {
    return RegisterResponModel(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [accessToken, tokenType, user];
}
