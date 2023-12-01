import 'dart:io';

abstract class FirebaseStorageRepository {
  Future<String> getUnknownImageUrl();

  Future<String> uploadImageToFirebase(File file);
}
