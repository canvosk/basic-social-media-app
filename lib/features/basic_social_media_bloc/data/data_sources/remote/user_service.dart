import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUserInformation({required String userId}) async {
    var x = _userCollection.doc(userId).get();
    debugPrint(x.toString());
    UserModel currentUser = UserModel.empty;
    return currentUser;
  }
}
