import 'dart:io';

import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/image_picker_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'share_post_event.dart';
part 'share_post_state.dart';

class SharePostBloc extends Bloc<SharePostEvent, SharePostState> {
  final ImagePickerUseCase _imagePickerUseCase;
  SharePostBloc(this._imagePickerUseCase) : super(const PostEditing()) {
    on<SharePost>((event, emit) {});
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
