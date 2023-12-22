import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/post_repository.dart';

class PostUseCase {
  final PostRepository _postRepository;

  const PostUseCase(this._postRepository);

  Future<bool> sharePost(
      {required String content, required String imageUrl}) async {
        return await _postRepository.sharePost(content: content, imageUrl: imageUrl);
      }
}
