import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/user_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_management_model.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserService _userService;

  const UserRepositoryImp(this._userService);

  @override
  Future<UserManagementModel> getUserInformation(
      {required String userId}) async {
    return await _userService.getUserInformation(userId: userId);
  }

  @override
  Future<bool> updateUserProfileImage(
      {required String userId, required String imageUrl}) async {
    return await _userService.updateUserProfileImage(
        userId: userId, imageUrl: imageUrl);
  }

  @override
  Future<List<UserModel>> searchUser({required String searchName}) async {
    return await _userService.searchUser(searchName: searchName);
  }

  @override
  Future<bool> followUser({required UserEntity userToFollow}) async {
    return await _userService.followUser(
        userToFollow: UserModel.fromEntity(userToFollow));
  }

  @override
  Future<bool> removeUser({required String userId}) async {
    return await _userService.removeUser(userId: userId);
  }

  @override
  Future<bool> unFollowUser({required String userId}) async {
    return await _userService.unFollowUser(userId: userId);
  }
}
