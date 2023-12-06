part of 'follow_user_bloc.dart';

sealed class FollowUserEvent extends Equatable {
  const FollowUserEvent();

  @override
  List<Object> get props => [];
}

class FollowUser extends FollowUserEvent {
  final UserEntity userToFollow;

  const FollowUser(this.userToFollow);

  @override
  List<Object> get props => [userToFollow];
}
