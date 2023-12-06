part of 'follow_user_bloc.dart';

sealed class FollowUserState extends Equatable {
  const FollowUserState();

  @override
  List<Object> get props => [];
}

final class FollowUserInitial extends FollowUserState {}

class FollowingUser extends FollowUserState {
  final String userId;

  const FollowingUser(this.userId);

  @override
  List<Object> get props => [userId];
}

class FollowedUser extends FollowUserState {
  final String userId;

  const FollowedUser(this.userId);

  @override
  List<Object> get props => [userId];
}

class FollowFailed extends FollowUserState {
  final String userId;

  const FollowFailed(this.userId);

  @override
  List<Object> get props => [userId];
}
