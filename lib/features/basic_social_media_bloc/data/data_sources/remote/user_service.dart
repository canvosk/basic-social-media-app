import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/local_storage_services.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_management_model.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserService {
  final LocalStorageService _localStorageService;

  UserService(this._localStorageService);

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserManagementModel> getUserInformation(
      {required String userId}) async {
    DocumentSnapshot doc = await _userCollection.doc(userId).get();
    if (doc.exists) {
      Object? userMap = doc.data();

      UserManagementModel userManagement = UserManagementModel.empty;

      UserModel currentUser = UserModel.fromJson(userMap as Map);

      //Getting followers info
      QuerySnapshot followers =
          await _userCollection.doc(userId).collection("followers").get();

      List<UserModel> followersUsers = [];

      for (var user in followers.docs) {
        followersUsers.add(UserModel.fromJson(user.data() as Map));
      }

      //Getting following info
      QuerySnapshot following =
          await _userCollection.doc(userId).collection("following").get();

      List<UserModel> followingUsers = [];

      for (var user in following.docs) {
        followingUsers.add(UserModel.fromJson(user.data() as Map));
      }

      userManagement = UserManagementModel(
        myUser: currentUser,
        followers: followersUsers,
        following: followingUsers,
      );

      return userManagement;
    }

    debugPrint(doc.toString());
    UserManagementModel userManagement = UserManagementModel.empty;
    return userManagement;
  }

  Future<bool> updateUserProfileImage(
      {required String userId, required String imageUrl}) async {
    bool isDone = await _userCollection.doc(userId).update({
      'profileImageUrl': imageUrl,
    }).then((_) {
      return true;
    }).catchError((error) {
      return false;
    });
    debugPrint(isDone.toString());
    return isDone;
  }

  Future<List<UserModel>> searchUser({required String searchName}) async {
    var searchedUsers = await _userCollection
        .where('name', isGreaterThanOrEqualTo: searchName)
        .get();
    debugPrint(searchedUsers.toString());

    List<UserModel> users = [];

    for (var userData in searchedUsers.docs) {
      String myUserId = await _localStorageService.getString(key: "userId");
      UserModel user = UserModel.fromJson(userData.data() as Map);
      if (user.userId != myUserId) {
        users.add(user);
      }
    }

    debugPrint(users.toString());

    return users;
  }

  Future<bool> followUser({required UserModel userToFollow}) async {
    try {
      String myUserId = await _localStorageService.getString(key: "userId");

      await _userCollection
          .doc(myUserId)
          .collection("following")
          .doc(userToFollow.userId)
          .set(userToFollow.toEntity().toMap());

      UserManagementModel myUserManagement =
          await getUserInformation(userId: myUserId);

      await _userCollection
          .doc(userToFollow.userId)
          .collection("followers")
          .doc(myUserId)
          .set(myUserManagement.myUser.toMap());

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> removeUser({required String userId}) async {
    try {
      String myUserId = await _localStorageService.getString(key: "userId");

      await _userCollection
          .doc(myUserId)
          .collection("followers")
          .doc(userId)
          .delete();

      await _userCollection
          .doc(userId)
          .collection("following")
          .doc(myUserId)
          .delete();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> unFollowUser({required String userId}) async {
    try {
      String myUserId = await _localStorageService.getString(key: "userId");

      await _userCollection
          .doc(myUserId)
          .collection("following")
          .doc(userId)
          .delete();

      await _userCollection
          .doc(userId)
          .collection("followers")
          .doc(myUserId)
          .delete();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
