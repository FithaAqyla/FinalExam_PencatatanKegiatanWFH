// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.alamat,
    required this.nik,
    required this.role,
  });

  final String name;
  final String email;
  final String password;
  final String alamat;
  final String nik;
  final int role;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'alamat': alamat,
      'nik': nik,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      alamat: map['alamat'] as String,
      nik: map['nik'] as String,
      role: map['role'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? alamat,
    String? nik,
    int? role,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      alamat: alamat ?? this.alamat,
      nik: nik ?? this.nik,
      role: role ?? this.role,
    );
  }
}
