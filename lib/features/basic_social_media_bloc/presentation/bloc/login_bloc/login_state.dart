part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}


class LoginSuccess extends LoginState {
  final UserEntitiy user;

  const LoginSuccess(this.user);
}

class LoginFailed extends LoginState {
  final String error;

  const LoginFailed(this.error);
}
