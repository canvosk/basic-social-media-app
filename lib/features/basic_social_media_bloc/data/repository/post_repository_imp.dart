import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/post_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/post_repository.dart';

class PostRepositoryImp implements PostRepository {
  final PostService _postService;

  const PostRepositoryImp(this._postService);

  @override
  Future<bool> sharePost(
      {required String content, required String imageUrl}) async {
    return await _postService.sharePost(content: content, imageUrl: imageUrl);
  }
}
