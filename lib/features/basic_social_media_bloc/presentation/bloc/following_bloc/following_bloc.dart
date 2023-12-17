import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final UserUseCase _userUseCase;
  FollowingBloc(this._userUseCase)
      : super(const FollowingBlocSuccess(
            currentUser: UserEntity.empty, unFollowedUsers: [])) {
    on<UnfollowFollowerEvent>((event, emit) async {
      emit(FollowingBlocLoading(
          currentUser: event.currentUser,
          unFollowedUsers: event.unFollowedUsers));

      try {
        bool isDone =
            await _userUseCase.unFollowUser(userId: event.currentUser.userId);
        if (isDone) {
          emit(FollowingBlocSuccess(
              currentUser: event.currentUser,
              unFollowedUsers: event.unFollowedUsers));
          return;
        }
        emit(FollowingBlocFailed(
            currentUser: event.currentUser,
            unFollowedUsers: event.unFollowedUsers));
      } catch (e) {
        debugPrint(e.toString());
        emit(FollowingBlocFailed(
            currentUser: event.currentUser,
            unFollowedUsers: event.unFollowedUsers));
      }
    });
    on<FollowFollowerEvent>((event, emit) async {
      emit(FollowingBlocLoading(
          currentUser: event.currentUser,
          unFollowedUsers: event.unFollowedUsers));

      try {
        bool isDone =
            await _userUseCase.followUser(userToFollow: event.currentUser);
        if (isDone) {
          emit(FollowingBlocSuccess(
              currentUser: event.currentUser,
              unFollowedUsers: event.unFollowedUsers));
          return;
        }
        emit(FollowingBlocFailed(
            currentUser: event.currentUser,
            unFollowedUsers: event.unFollowedUsers));
      } catch (e) {
        debugPrint(e.toString());
        emit(FollowingBlocFailed(
            currentUser: event.currentUser,
            unFollowedUsers: event.unFollowedUsers));
      }
    });
  }
}
