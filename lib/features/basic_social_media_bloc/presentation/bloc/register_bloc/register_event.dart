part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class Register extends RegisterEvent{
  final UserEntity user;

  const Register(this.user);
}