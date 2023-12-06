import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {

  Future<UserEntity> login({required UserEntity myUser});

  Future<UserEntity> register(UserEntity myUser);

}