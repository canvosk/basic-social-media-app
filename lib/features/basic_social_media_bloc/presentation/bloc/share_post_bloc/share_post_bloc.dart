import 'dart:io';

import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/image_picker_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/post_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'share_post_event.dart';
part 'share_post_state.dart';

class SharePostBloc extends Bloc<SharePostEvent, SharePostState> {
  final ImagePickerUseCase _imagePickerUseCase;
  final PostUseCase _postUseCase;

  SharePostBloc(this._imagePickerUseCase, this._postUseCase)
      : super(const PostEditing()) {
    on<SharePost>((event, emit) async {
      try {
        String postImageUrl = "";
        event.image != null
            ? postImageUrl =
                await _postUseCase.uploadPostImage(file: event.image!)
            : postImageUrl = "";

        bool isDone = await _postUseCase.sharePost(
            content: event.content ?? "", imageUrl: postImageUrl);

        isDone
            ? emit(PostShared())
            : emit(const SharePostFailed("Cancelled Post"));
      } catch (e) {
        debugPrint(e.toString());
        emit(SharePostFailed(e.toString()));
      }
    });
    on<TakeImage>((event, emit) async {
      try {
        XFile? image = await _imagePickerUseCase.call(params: event.source);
        if (image == null) {
          emit(const SharePostFailed("Failed taking image"));
          return;
        }
        File pickedFile = File(image.path);

        emit(PostEditing(image: pickedFile));
        return;
      } catch (e) {
        debugPrint(e.toString());
        emit(SharePostFailed(e.toString()));
      }
    });
  }
}
