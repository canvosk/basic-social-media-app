part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class Registering extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserEntity user;

  const RegisterSuccess(this.user);
}

class RegisterFailed extends RegisterState {
  final String error;

  const RegisterFailed(this.error);
}
