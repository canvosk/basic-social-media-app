import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final UserUseCase _userUseCase;
  FollowersBloc(this._userUseCase)
      : super(const FollowersBlocSuccess(
            currentUser: UserEntity.empty, removedUsers: [])) {
    on<RemoveFollowerEvent>((event, emit) async {
      emit(FollowersBlocLoading(
          currentUser: event.currentUser, removedUsers: event.removedUsers));
      try {
        bool isDone =
            await _userUseCase.removeUser(userId: event.currentUser.userId);

        if (isDone) {
          emit(FollowersBlocSuccess(
              currentUser: UserEntity.empty, removedUsers: event.removedUsers));
          return;
        }

        emit(FollowersBlocFailed(
            currentUser: UserEntity.empty, removedUsers: event.removedUsers));
      } catch (e) {
        debugPrint(e.toString());
        emit(FollowersBlocFailed(
            currentUser: UserEntity.empty, removedUsers: event.removedUsers));
      }
    });
  }
}
