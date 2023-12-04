import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';

abstract class UserRepository {
  Future<UserEntitiy> getUserInformation({required String userId});

  Future<bool> updateUserProfileImage(
      {required String userId, required String imageUrl});

  Future<List<UserEntitiy>> searchUser({required String searchName});
}
