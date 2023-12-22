import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/local_storage_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  final LocalStorageService _localStorageService;

  PostService(this._localStorageService);

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<bool> sharePost(
      {required String content, required String imageUrl}) async {
    String myUserId = await _localStorageService.getString(key: "userId");

    await _userCollection.doc("uuid").set("model");

    return true;
  }
}
