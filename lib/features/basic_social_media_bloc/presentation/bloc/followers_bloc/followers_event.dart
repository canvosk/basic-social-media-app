part of 'followers_bloc.dart';

sealed class FollowersEvent extends Equatable {
  const FollowersEvent();

  @override
  List<Object> get props => [];
}

class RemoveFollowerEvent extends FollowersEvent {
  final UserEntity currentUser;
  final List<FollowerBlocEntity> users;

  const RemoveFollowerEvent({required this.currentUser, required this.users});
}

class FollowBackFollower extends FollowersEvent {
  final UserEntity currentUser;
  final List<FollowerBlocEntity> users;

  const FollowBackFollower({required this.currentUser, required this.users});
}
