part of 'followers_bloc.dart';

sealed class FollowersEvent extends Equatable {
  const FollowersEvent();

  @override
  List<Object> get props => [];
}

class RemoveFollowerEvent extends FollowersEvent {
  final UserEntity currentUser;
  final List<String> removedUsers;

  const RemoveFollowerEvent({required this.currentUser, required this.removedUsers});
}
