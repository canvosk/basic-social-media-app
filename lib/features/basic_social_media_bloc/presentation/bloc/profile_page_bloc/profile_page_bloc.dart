import 'dart:io';

import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/image_picker_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final UserUseCase _userUseCase;
  final ImagePickerUseCase _imagePickerUseCase;

  ProfilePageBloc(this._userUseCase, this._imagePickerUseCase)
      : super(ProfilePageInitial()) {
    on<GetUserInformation>((event, emit) async {
      emit(ProfilePageGettingData());
      try {
        UserEntitiy currentUser = await _userUseCase.call(params: event.userId);
        emit(ProfilePageDataSuccess(currentUser));
      } catch (e) {
        debugPrint(e.toString());
        emit(ProfilePageDataFailed(e.toString()));
      }
    });
    on<UpdateUserPhoto>((event, emit) async {
      emit(ProfilePhotoUpdating());
      try {
        XFile? image = await _imagePickerUseCase.call(params: event.source);
        if (image == null) {
          emit(ProfilePageDataSuccess(event.user));
          return;
        }
        File pickedFile = File(image.path);
        String profileImage = await _userUseCase.uploadImage(file: pickedFile);
        if (profileImage == "") {
          emit(ProfilePageDataSuccess(event.user));
          return;
        }
        UserEntitiy newUser =
            event.user.copyWith(profileImageUrl: profileImage);
        emit(ProfilePageDataSuccess(newUser));
      } catch (e) {
        debugPrint(e.toString());
        emit(ProfilePhotoUpdateFailed(e.toString()));
      }
    });
  }
}
