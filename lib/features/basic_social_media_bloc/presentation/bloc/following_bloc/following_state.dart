part of 'following_bloc.dart';

sealed class FollowingState extends Equatable {
  const FollowingState();

  @override
  List<Object> get props => [];
}

class FollowingBlocLoading extends FollowingState {
  final UserEntity currentUser;
  final List<String> unFollowedUsers;

  const FollowingBlocLoading(
      {required this.currentUser, required this.unFollowedUsers});

  @override
  List<Object> get props => [currentUser, unFollowedUsers];
}

class FollowingBlocSuccess extends FollowingState {
  final UserEntity currentUser;
  final List<String> unFollowedUsers;

  const FollowingBlocSuccess(
      {required this.currentUser, required this.unFollowedUsers});

  @override
  List<Object> get props => [currentUser, unFollowedUsers];
}

class FollowingBlocFailed extends FollowingState {
  final UserEntity currentUser;
  final List<String> unFollowedUsers;

  const FollowingBlocFailed(
      {required this.currentUser, required this.unFollowedUsers});

  @override
  List<Object> get props => [currentUser, unFollowedUsers];
}
