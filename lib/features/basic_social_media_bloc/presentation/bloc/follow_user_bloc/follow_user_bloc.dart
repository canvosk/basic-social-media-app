import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'follow_user_event.dart';
part 'follow_user_state.dart';

class FollowUserBloc extends Bloc<FollowUserEvent, FollowUserState> {
  final UserUseCase _userUseCase;
  FollowUserBloc(this._userUseCase) : super(FollowUserInitial()) {
    on<FollowUser>((event, emit) async {
      emit(FollowingUser(event.userToFollow.userId));
      try {
        bool isDone =
            await _userUseCase.followUser(userToFollow: event.userToFollow);
        if (isDone) {
          emit(FollowedUser(event.userToFollow.userId));
          return;
        }
        emit(FollowFailed(event.userToFollow.userId));
        return;
      } catch (e) {
        debugPrint(e.toString());
        emit(FollowFailed(event.userToFollow.userId));
      }
    });
  }
}
