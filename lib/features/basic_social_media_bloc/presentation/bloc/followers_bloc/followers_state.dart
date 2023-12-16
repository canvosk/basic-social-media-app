part of 'followers_bloc.dart';

sealed class FollowersState extends Equatable {
  const FollowersState();

  @override
  List<Object> get props => [];
}

final class FollowersInitial extends FollowersState {}

class RemovingFollowers extends FollowersState {
  final String followersUserId;
  const RemovingFollowers(this.followersUserId);

  @override
  List<Object> get props => [followersUserId];
}

class RemovedFollower extends FollowersState {
  final List<FollowerBlocEntity> users;
  const RemovedFollower(this.users);

  @override
  List<Object> get props => [users];
}

class FollowedBack extends FollowersState {}

class FailedFollowers extends FollowersState {}
