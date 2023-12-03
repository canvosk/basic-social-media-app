part of 'profile_page_bloc.dart';

sealed class ProfilePageState extends Equatable {
  const ProfilePageState();

  @override
  List<Object> get props => [];
}

final class ProfilePageInitial extends ProfilePageState {}

class ProfilePageGettingData extends ProfilePageState {}

class ProfilePageDataSuccess extends ProfilePageState {
  final UserEntitiy user;

  const ProfilePageDataSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class ProfilePageDataFailed extends ProfilePageState {
  final String exception;

  const ProfilePageDataFailed(this.exception);
}

class ProfilePhotoUpdating extends ProfilePageState {
  final UserEntitiy user;

  const ProfilePhotoUpdating(this.user);

  @override
  List<Object> get props => [user];
}

class ProfilePhotoUpdateFailed extends ProfilePageState {
  final String exception;

  const ProfilePhotoUpdateFailed(this.exception);
}
