// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String profileImageUrl;

  const UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.profileImageUrl,
  });

  static const empty = UserEntity(
    userId: '',
    name: '',
    email: '',
    password: '',
    profileImageUrl: '',
  );

  UserEntity copyWith({
    String? userId,
    String? name,
    String? email,
    String? password,
    String? profileImageUrl,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'profileImageUrl': profileImageUrl,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      profileImageUrl: map['profileImageUrl'],
    );
  }

  @override
  List<Object?> get props => [userId, name, email, password, profileImageUrl];
}
