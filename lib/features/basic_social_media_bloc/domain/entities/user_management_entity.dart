import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserManagementEntity extends Equatable {
  final UserEntity myUser;
  final List<UserEntity> followers;
  final List<UserEntity> following;

  const UserManagementEntity({
    required this.myUser,
    required this.followers,
    required this.following,
  });

  static const empty = UserManagementEntity(
    myUser: UserEntity.empty,
    followers: [],
    following: [],
  );

  UserManagementEntity copyWith({
    UserEntity? myUser,
    List<UserEntity>? followers,
    List<UserEntity>? following,
  }) {
    return UserManagementEntity(
      myUser: myUser ?? this.myUser,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'myUser': myUser,
      'followers': followers,
      'following': following,
    };
  }

  static UserManagementEntity fromMap(Map<String, dynamic> map) {
    return UserManagementEntity(
      myUser: map['myUser'],
      followers: map['followers'],
      following: map['following'],
    );
  }

  @override
  List<Object?> get props => [myUser, followers, following];
}
