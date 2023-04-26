import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenRequest {
  final String email;
  final String password;
  TokenRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory TokenRequest.fromMap(Map<String, dynamic> map) {
    return TokenRequest(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenRequest.fromJson(String source) =>
      TokenRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
