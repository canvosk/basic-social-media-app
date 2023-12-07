import 'dart:io';

import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/firebase_storage_repository.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/user_repository.dart';

class UserUseCase implements UseCase<UserManagementEntity, String> {
  final UserRepository _userRepository;
  final FirebaseStorageRepository _firebaseStorageRepository;

  const UserUseCase(this._userRepository, this._firebaseStorageRepository);

  @override
  Future<UserManagementEntity> call({required String params}) async {
    return await _userRepository.getUserInformation(userId: params);
  }

  Future<String> uploadImage({required File file}) async {
    return await _firebaseStorageRepository.uploadImageToFirebase(file);
  }

  Future<bool> updateUserProfileImageInfo(
      {required String userId, required String imageUrl}) async {
    return await _userRepository.updateUserProfileImage(
        userId: userId, imageUrl: imageUrl);
  }

  Future<List<UserEntity>> searchUser({required String searchName}) async {
    return await _userRepository.searchUser(searchName: searchName);
  }

  Future<bool> followUser({required UserEntity userToFollow}) async {
    return await _userRepository.followUser(userToFollow: userToFollow);
  }
}
