import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/follower_bloc_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  FollowersBloc() : super(FollowersInitial()) {
    on<RemoveFollowerEvent>((event, emit) {
      emit(RemovingFollowers(event.currentUserId));
      try {
        for (var user in event.followersBlocEntity) {
          if (user.userId == event.currentUserId) {
            user.copyWith(isCurrent: false);
          }
        }
        emit(RemovedFollower(event.followersBlocEntity));
      } catch (e) {
        debugPrint(e.toString());
        emit(FailedFollowers());
      }
    });
  }
}
