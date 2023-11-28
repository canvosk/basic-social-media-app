import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';

class UserModel extends UserEntitiy {
  const UserModel({
    required super.userId,
    required super.name,
    required super.email,
    required super.password,
    required super.profileImageUrl,
  });

  static const empty = UserModel(
		userId: '', 
    name: '',
		email: '', 
    password: '',
    profileImageUrl: '',
	);

  factory UserModel.fromJson(Map<dynamic, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      profileImageUrl: map['profileImageUrl'] ?? "",
    );
  }

  factory UserModel.fromEntity(UserEntitiy entity) {
    return UserModel(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      password: entity.password,
      profileImageUrl: entity.profileImageUrl,
    );
  }

  @override
  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? password,
    String? profileImageUrl,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  UserEntitiy toEntity() {
    return UserEntitiy(
      userId: userId,
      name: name,
      email: email,
      password: password,
      profileImageUrl: profileImageUrl,
    );
  }

  	@override
	List<Object?> get props => [userId, name, email, password, profileImageUrl];
  
}
