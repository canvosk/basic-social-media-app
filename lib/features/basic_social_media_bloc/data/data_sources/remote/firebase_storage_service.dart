import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseStorageService {

  final FirebaseStorage _storage = FirebaseStorage.instance;

  FirebaseStorageService({
		FirebaseAuth? firebaseAuth,
	});

  Future<String> getUnknownImageUrl() async {
    // Firebase Storage'dan fotoğrafı indirme işlemi

    var unknownImageUrl = await _storage
        .ref().child('profile_images/unknown_image.jpeg')
        .getDownloadURL();

    debugPrint(unknownImageUrl);

    return unknownImageUrl;
  }


}
