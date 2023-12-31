import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';

class ProfilePageFuncs {
  static bool checkFollowers(
      {required UserManagementEntity userManagementEntity,
      required String followerId}) {
    bool isIFollow = false;

    for (var following in userManagementEntity.following) {
      if (followerId == following.userId) {
        isIFollow = true;
      }
    }

    return isIFollow;
  }

  static bool chekUnfollowed(
      {required List<String> unFollowedUsers, required String userId}) {
    bool isUnfollowed = false;

    for (var u in unFollowedUsers) {
      if (u == userId) {
        isUnfollowed = true;
      }
    }

    return isUnfollowed;
  }
}
