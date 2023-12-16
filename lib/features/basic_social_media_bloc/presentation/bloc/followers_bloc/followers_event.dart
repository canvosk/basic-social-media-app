part of 'followers_bloc.dart';

sealed class FollowersEvent extends Equatable {
  const FollowersEvent();

  @override
  List<Object> get props => [];
}

class RemoveFollowerEvent extends FollowersEvent {
  final List<FollowerBlocEntity> followersBlocEntity;
  final String currentUserId;
  const RemoveFollowerEvent(this.followersBlocEntity, this.currentUserId);
}

class FollowBackFollower extends FollowersEvent {
  final List<FollowerBlocEntity> followersBlocEntity;
  final String currentUserId;
  const FollowBackFollower(this.followersBlocEntity, this.currentUserId);
}
