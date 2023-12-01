import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  FirebaseStorageService({
    FirebaseAuth? firebaseAuth,
  });

  Future<String> getUnknownImageUrl() async {
    // Firebase Storage'dan fotoğrafı indirme işlemi

    var unknownImageUrl = await _storage
        .ref()
        .child('profile_images/unknown_image.jpeg')
        .getDownloadURL();

    debugPrint(unknownImageUrl);

    return unknownImageUrl;
  }

  Future<String?> uploadImageToFirebase(File imageFile) async {
    String fileName = basename(imageFile.path);

    Reference firebaseStorageRef =
        _storage.ref().child('profile_images/$fileName');

    UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);

    TaskSnapshot taskSnapshot = await uploadTask;

    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }
}
