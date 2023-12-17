import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/follower_bloc_entity.dart';
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
            currentUser: UserEntity.empty, users: [])) {
    on<RemoveFollowerEvent>((event, emit) async {
      emit(FollowersBlocLoading(
          currentUser: event.currentUser, users: event.users));
      try {
        bool isDone =
            await _userUseCase.removeUser(userId: event.currentUser.userId);
        for (var user in event.users) {
          if (user.user.userId == event.currentUser.userId) {
            user.copyWith(isRemoved: true, isCurrent: false);
          }
        }
        if (isDone) {
          emit(FollowersBlocSuccess(
              currentUser: UserEntity.empty, users: event.users));
          return;
        }

        emit(FollowersBlocFailed(
            currentUser: UserEntity.empty, users: event.users));
      } catch (e) {
        debugPrint(e.toString());
        emit(FollowersBlocFailed(
            currentUser: UserEntity.empty, users: event.users));
      }
    });
    on<FollowBackFollower>((event, emit) async {
      emit(FollowersBlocLoading(
          currentUser: event.currentUser, users: event.users));
      try {
        bool isDone =
            await _userUseCase.followUser(userToFollow: event.currentUser);
        for (var user in event.users) {
          if (user.user.userId == event.currentUser.userId) {
            user.copyWith(isRemoved: false, isCurrent: false);
          }
        }
        if (isDone) {
          emit(FollowersBlocSuccess(
              currentUser: UserEntity.empty, users: event.users));
          return;
        }

        emit(FollowersBlocFailed(
            currentUser: UserEntity.empty, users: event.users));
      } catch (e) {
        debugPrint(e.toString());
        emit(FollowersBlocFailed(
            currentUser: UserEntity.empty, users: event.users));
      }
    });
  }
}
