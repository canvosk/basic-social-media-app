import 'dart:io';

import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/firebase_storage_repository.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/user_repository.dart';

class UserUseCase implements UseCase<UserEntitiy, String> {
  final UserRepository _userRepository;
  final FirebaseStorageRepository _firebaseStorageRepository;

  const UserUseCase(this._userRepository, this._firebaseStorageRepository);

  @override
  Future<UserEntitiy> call({required String params}) async {
    return await _userRepository.getUserInformation(userId: params);
  }

  Future<String> uploadImage({required File file}) async {
    return await _firebaseStorageRepository.uploadImageToFirebase(file);
  }
}
