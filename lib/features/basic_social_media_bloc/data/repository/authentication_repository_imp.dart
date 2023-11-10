import 'dart:developer';

import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/authentication_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/storage_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final AuthenticationService _authenticationService;
  final StorageService _storageService;

  const AuthenticationRepositoryImp(
      this._authenticationService, this._storageService);

  @override
  Future<UserEntitiy> login() {
    throw UnimplementedError();
  }

  @override
  Future<UserEntitiy> register(UserEntitiy myUser) async {
    try {
      UserModel user = UserModel.fromEntity(myUser);
      user = await _authenticationService.register(user);
      String imageuRL = await _storageService.getUnknownImageUrl();
      user.copyWith(
        profileImageUrl: imageuRL,
      );
      await _authenticationService.setUserData(user);
      return user.toEntity();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
