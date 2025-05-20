import 'dart:convert';

import 'package:equatable/equatable.dart';

class LogoutResponModel extends Equatable {
  final String? message;

  const LogoutResponModel({this.message});

  factory LogoutResponModel.fromMap(Map<String, dynamic> data) {
    return LogoutResponModel(message: data['message'] as String?);
  }

  Map<String, dynamic> toMap() => {'message': message};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LogoutResponModel].
  factory LogoutResponModel.fromJson(String data) {
    return LogoutResponModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LogoutResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LogoutResponModel copyWith({String? message}) {
    return LogoutResponModel(message: message ?? this.message);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
