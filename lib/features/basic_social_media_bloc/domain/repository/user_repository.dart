import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';

abstract class UserRepository{

  Future<UserEntitiy> getUserInformation({required String userId});

}