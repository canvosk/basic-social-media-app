import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';

abstract class UserRepository {
  Future<UserManagementEntity> getUserInformation({required String userId});

  Future<bool> updateUserProfileImage(
      {required String userId, required String imageUrl});

  Future<List<UserEntity>> searchUser({required String searchName});

  Future<bool> followUser({required UserEntity userToFollow});

  Future<bool> removeUser({required String userId});

  Future<bool> unFollowUser({required String userId});
}
