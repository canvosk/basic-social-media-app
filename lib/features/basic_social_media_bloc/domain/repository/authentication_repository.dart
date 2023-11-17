import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';

abstract class AuthenticationRepository {

  Future<UserEntitiy> login({required UserEntitiy myUser});

  Future<UserEntitiy> register(UserEntitiy myUser);

}