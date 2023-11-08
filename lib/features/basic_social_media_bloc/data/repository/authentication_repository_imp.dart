import 'dart:developer';

import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/authentication_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final AuthenticationService _authenticationService;

  const AuthenticationRepositoryImp(this._authenticationService);

  @override
  Future<UserEntitiy> login() {
    throw UnimplementedError();
  }

  @override
  Future<UserEntitiy> register(UserEntitiy myUser) async {
    try {
      UserModel user = UserModel.fromEntity(myUser);
      user = await _authenticationService.register(user);
      await _authenticationService.setUserData(user);
      return user.toEntity();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
