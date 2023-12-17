part of 'followers_bloc.dart';

sealed class FollowersState extends Equatable {
  const FollowersState();

  @override
  List<Object> get props => [];
}

class FollowersBlocLoading extends FollowersState {
  final UserEntity currentUser;
  final List<String> removedUsers;

  const FollowersBlocLoading(
      {required this.currentUser, required this.removedUsers});

  @override
  List<Object> get props => [currentUser, removedUsers];
}

class FollowersBlocSuccess extends FollowersState {
  final UserEntity currentUser;
  final List<String> removedUsers;

  const FollowersBlocSuccess(
      {required this.currentUser, required this.removedUsers});

  @override
  List<Object> get props => [currentUser, removedUsers];
}

class FollowersBlocFailed extends FollowersState {
  final UserEntity currentUser;
  final List<String> removedUsers;

  const FollowersBlocFailed(
      {required this.currentUser, required this.removedUsers});

  @override
  List<Object> get props => [currentUser, removedUsers];
}
