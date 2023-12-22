import 'dart:io';

import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/firebase_storage_repository.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/post_repository.dart';

class PostUseCase {
  final PostRepository _postRepository;
  final FirebaseStorageRepository _firebaseStorageRepository;

  const PostUseCase(this._postRepository, this._firebaseStorageRepository);

  Future<bool> sharePost(
      {required String content, required String imageUrl}) async {
    return await _postRepository.sharePost(
        content: content, imageUrl: imageUrl);
  }

  Future<String> uploadPostImage({required File file}) async {
    return await _firebaseStorageRepository.uploadPostImageToFirebase(file);
  }
}
