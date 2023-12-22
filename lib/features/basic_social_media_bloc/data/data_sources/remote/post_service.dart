import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/local_storage_services.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class PostService {
  final LocalStorageService _localStorageService;

  PostService(this._localStorageService);

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<bool> sharePost(
      {required String content, required String imageUrl}) async {
    try {
      String myUserId = await _localStorageService.getString(key: "userId");

      PostModel newPost = PostModel.empty;

      var postUuid = const Uuid();

      newPost = newPost.copyWith(
          postId: postUuid.v1(),
          postedBy: myUserId,
          content: content,
          imageUrl: imageUrl);

      await _userCollection
          .doc(
            postUuid.v1(),
          )
          .set(newPost.toMap());

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

}
