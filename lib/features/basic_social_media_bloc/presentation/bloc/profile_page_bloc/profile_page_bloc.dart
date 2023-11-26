import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final UserUseCase _userUseCase;
  ProfilePageBloc(this._userUseCase) : super(ProfilePageInitial()) {
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
  }
}
