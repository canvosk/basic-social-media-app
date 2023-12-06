part of 'profile_page_bloc.dart';

sealed class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();

  @override
  List<Object> get props => [];
}

class GetUserInformation extends ProfilePageEvent {
  final String userId;

  const GetUserInformation(this.userId);
}

class UpdateUserPhoto extends ProfilePageEvent {
  final ImageSource source;
  final UserEntity user;

  const UpdateUserPhoto({required this.source, required this.user});
}
