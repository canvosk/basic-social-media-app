part of 'following_bloc.dart';

sealed class FollowingEvent extends Equatable {
  const FollowingEvent();

  @override
  List<Object> get props => [];
}

class UnfollowFollowerEvent extends FollowingEvent {
  final UserEntity currentUser;
  final List<String> unFollowedUsers;

  const UnfollowFollowerEvent(
      {required this.currentUser, required this.unFollowedUsers});
}

class FollowFollowerEvent extends FollowingEvent {
  final UserEntity currentUser;
  final List<String> unFollowedUsers;

  const FollowFollowerEvent(
      {required this.currentUser, required this.unFollowedUsers});
}
