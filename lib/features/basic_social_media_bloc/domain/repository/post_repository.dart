abstract class PostRepository {
  Future<bool> sharePost({required String content, required String imageUrl});
}
