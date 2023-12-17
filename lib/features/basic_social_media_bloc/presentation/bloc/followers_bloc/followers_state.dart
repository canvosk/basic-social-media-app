part of 'followers_bloc.dart';

sealed class FollowersState extends Equatable {
  const FollowersState();

  @override
  List<Object> get props => [];
}

class FollowersBlocLoading extends FollowersState {
  final UserEntity currentUser;
  final List<FollowerBlocEntity> users;

  const FollowersBlocLoading({required this.currentUser, required this.users});

  @override
  List<Object> get props => [currentUser, users];
}

class FollowersBlocSuccess extends FollowersState {
  final UserEntity currentUser;
  final List<FollowerBlocEntity> users;

  const FollowersBlocSuccess({required this.currentUser, required this.users});

  @override
  List<Object> get props => [currentUser, users];
}

class FollowersBlocFailed extends FollowersState {
  final UserEntity currentUser;
  final List<FollowerBlocEntity> users;

  const FollowersBlocFailed({required this.currentUser, required this.users});

  @override
  List<Object> get props => [currentUser, users];
}
