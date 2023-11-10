// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntitiy extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String profileImageUrl;

  const UserEntitiy({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.profileImageUrl,
  });

  static const empty = UserEntitiy(
    userId: '',
    name: '',
    email: '',
    password: '',
    profileImageUrl: '',
  );

  UserEntitiy copyWith({
    String? userId,
    String? name,
    String? email,
    String? password,
    String? profileImageUrl,
  }) {
    return UserEntitiy(
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

  static UserEntitiy fromMap(Map<String, dynamic> map) {
    return UserEntitiy(
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
