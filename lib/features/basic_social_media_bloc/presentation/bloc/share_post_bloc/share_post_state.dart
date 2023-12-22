part of 'share_post_bloc.dart';

sealed class SharePostState extends Equatable {
  const SharePostState();

  @override
  List<Object> get props => [];
}

final class PostEditing extends SharePostState {
  final String? content;
  final File? image;

  const PostEditing({this.content, this.image});
}

final class PostShared extends SharePostState {}

final class SharePostFailed extends SharePostState {
  final String exception;

  const SharePostFailed(this.exception);

  @override
  List<Object> get props => [exception];
}
