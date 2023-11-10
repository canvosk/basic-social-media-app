import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {

  final FirebaseStorage _storage = FirebaseStorage.instance;

  StorageService({
		FirebaseAuth? firebaseAuth,
	});

  Future<String> getUnknownImageUrl() async {
    // Firebase Storage'dan fotoğrafı indirme işlemi
    var unknownImageUrl = await _storage
        .ref('profile_images/unknown_image.jpeg')
        .getDownloadURL();

    return unknownImageUrl;
  }


}
