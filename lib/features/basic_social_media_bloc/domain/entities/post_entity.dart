// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String postId;
  final String postedBy;
  final String content;
  final String imageUrl;

  const PostEntity({
    required this.postId,
    required this.postedBy,
    required this.content,
    required this.imageUrl,
  });

  static const empty = PostEntity(
    postId: '',
    postedBy: '',
    content: '',
    imageUrl: '',
  );

  PostEntity copyWith({
    String? postId,
    String? postedBy,
    String? content,
    String? imageUrl,
  }) {
    return PostEntity(
      postId: postId ?? this.postId,
      postedBy: postedBy ?? this.postedBy,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'postId': postId,
      'postedBy': postedBy,
      'content': content,
      'imageUrl': imageUrl,
    };
  }

  static PostEntity fromMap(Map<String, dynamic> map) {
    return PostEntity(
      postId: map['postId'],
      postedBy: map['postedBy'],
      content: map['content'],
      imageUrl: map['imageUrl'],
    );
  }

  @override
  List<Object?> get props => [postId, postedBy, content, imageUrl];
}
