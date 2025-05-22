import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class UserResponModel extends Equatable {
  final User? user;

  const UserResponModel({this.user});

  factory UserResponModel.fromMap(Map<String, dynamic> data) {
    return UserResponModel(
      user:
          data['user'] == null
              ? null
              : User.fromMap(data['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {'user': user?.toMap()};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserResponModel].
  factory UserResponModel.fromJson(String data) {
    return UserResponModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserResponModel copyWith({User? user}) {
    return UserResponModel(user: user ?? this.user);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user];
}
