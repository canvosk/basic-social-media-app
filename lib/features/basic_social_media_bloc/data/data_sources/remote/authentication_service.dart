import 'dart:developer';

import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  AuthenticationService({
		FirebaseAuth? firebaseAuth,
	}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserModel> login({required UserModel myUser}) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
				email: myUser.email, 
				password: myUser.password
			);

      myUser = myUser.copyWith(
        userId: user.user!.uid,
      );

      return myUser;

    } catch (e) {
      log(e.toString());
			rethrow;
    }
  }

  Future<UserModel> register(UserModel myUser) async {
     try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
				email: myUser.email, 
				password: myUser.password
			);

			myUser = myUser.copyWith(
				userId: user.user!.uid
			);

			return myUser;
    } catch (e) {
      log(e.toString());
			rethrow;
    }
    
  }

  Future<void> setUserData(UserModel myUser) async {
    try {
      await usersCollection
				.doc(myUser.userId)
				.set(myUser.toEntity().toMap());
    } catch (e) {
      log(e.toString());
			rethrow;
    }
  }

}
