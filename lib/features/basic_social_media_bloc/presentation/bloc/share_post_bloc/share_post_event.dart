part of 'share_post_bloc.dart';

sealed class SharePostEvent extends Equatable {
  const SharePostEvent();

  @override
  List<Object> get props => [];
}

class SharePost extends SharePostEvent {
  final String? content;
  final File? image;

  const SharePost({this.content, this.image});
}

class TakeImage extends SharePostEvent {
  final ImageSource source;

  const TakeImage({required this.source});
}
