import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginResponModel extends Equatable {
	final String? message;
	final String? token;
	final User? user;

	const LoginResponModel({this.message, this.token, this.user});

	factory LoginResponModel.fromMap(Map<String, dynamic> data) {
		return LoginResponModel(
			message: data['message'] as String?,
			token: data['token'] as String?,
			user: data['user'] == null
						? null
						: User.fromMap(data['user'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'message': message,
				'token': token,
				'user': user?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginResponModel].
	factory LoginResponModel.fromJson(String data) {
		return LoginResponModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [LoginResponModel] to a JSON string.
	String toJson() => json.encode(toMap());

	LoginResponModel copyWith({
		String? message,
		String? token,
		User? user,
	}) {
		return LoginResponModel(
			message: message ?? this.message,
			token: token ?? this.token,
			user: user ?? this.user,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [message, token, user];
}
