import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.postId,
    required super.postedBy,
    required super.content,
    required super.imageUrl,
  });

  static const empty = PostModel(
    postId: '',
    postedBy: '',
    content: '',
    imageUrl: '',
  );

  factory PostModel.fromJson(Map<dynamic, dynamic> map) {
    return PostModel(
      postId: map['postId'] ?? "",
      postedBy: map['postedBy'] ?? "",
      content: map['content'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
    );
  }

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      postId: entity.postId,
      postedBy: entity.postedBy,
      content: entity.content,
      imageUrl: entity.imageUrl,
    );
  }

  @override
  PostModel copyWith({
    String? postId,
    String? postedBy,
    String? content,
    String? imageUrl,
  }) {
    return PostModel(
      postId: postId ?? this.postId,
      postedBy: postedBy ?? this.postedBy,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      postId: postId,
      postedBy: postedBy,
      content: content,
      imageUrl: imageUrl,
    );
  }

  @override
  List<Object?> get props => [postId, postedBy, content, imageUrl];
}
