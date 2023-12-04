import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUserInformation({required String userId}) async {
    DocumentSnapshot doc = await _userCollection.doc(userId).get();
    if (doc.exists) {
      Object? userMap = doc.data();
      UserModel currentUser = UserModel.fromJson(userMap as Map);
      return currentUser;
    }

    debugPrint(doc.toString());
    UserModel currentUser = UserModel.empty;
    return currentUser;
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
    var searchedUsers =
        await _userCollection.where('name', isEqualTo: searchName).get();
    debugPrint(searchedUsers.toString());

    List<UserModel> users = [];

    for (var userData in searchedUsers.docs) {
      UserModel user = UserModel.fromJson(userData.data() as Map);
      users.add(user);
    }

    debugPrint(users.toString());

    return users;
  }
}
