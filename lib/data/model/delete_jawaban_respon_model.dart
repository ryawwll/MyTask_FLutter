import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeleteJawabanResponModel extends Equatable {
  final String? message;

  const DeleteJawabanResponModel({this.message});

  factory DeleteJawabanResponModel.fromMap(Map<String, dynamic> data) {
    return DeleteJawabanResponModel(message: data['message'] as String?);
  }

  Map<String, dynamic> toMap() => {'message': message};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeleteJawabanResponModel].
  factory DeleteJawabanResponModel.fromJson(String data) {
    return DeleteJawabanResponModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [DeleteJawabanResponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  DeleteJawabanResponModel copyWith({String? message}) {
    return DeleteJawabanResponModel(message: message ?? this.message);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message];
}
