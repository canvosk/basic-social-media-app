import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/follower_bloc_entity.dart';
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

  static bool checkRemoved(
      {required List<FollowerBlocEntity> users, required String followerId}) {
    bool isRemoved = false;

    for (var user in users) {
      if (followerId == user.user.userId && user.isRemoved) {
        isRemoved = true;
      }
    }

    return isRemoved;
  }

  static bool checkFollowedBack(
      {required List<FollowerBlocEntity> users, required String followerId}) {
    bool isRemoved = false;

    for (var user in users) {
      if (followerId == user.user.userId && !user.isRemoved) {
        isRemoved = true;
      }
    }

    return isRemoved;
  }
}
