import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';

class UserManagementModel extends UserManagementEntity {
  const UserManagementModel({
    required super.myUser,
    required super.followers,
    required super.following,
  });

  static const empty = UserManagementModel(
    myUser: UserEntity.empty,
    followers: [],
    following: [],
  );

  factory UserManagementModel.fromJson(Map<dynamic, dynamic> map) {
    return UserManagementModel(
      myUser: map['myUser'] ?? "",
      followers: map['followers'] ?? [],
      following: map['following'] ?? [],
    );
  }

  factory UserManagementModel.fromEntity(UserManagementEntity entity) {
    return UserManagementModel(
      myUser: entity.myUser,
      followers: entity.followers,
      following: entity.following,
    );
  }

  @override
  UserManagementModel copyWith({
    UserEntity? myUser,
    List<UserEntity>? followers,
    List<UserEntity>? following,
  }) {
    return UserManagementModel(
      myUser: myUser ?? this.myUser,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  UserManagementEntity toEntity() {
    return UserManagementEntity(
      myUser: myUser,
      followers: followers,
      following: following,
    );
  }

  @override
  List<Object?> get props => [myUser, followers, following];
}
