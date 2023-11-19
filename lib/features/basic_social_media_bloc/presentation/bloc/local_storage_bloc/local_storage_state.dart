part of 'local_storage_bloc.dart';

sealed class LocalStorageState extends Equatable {
  const LocalStorageState();
  
  @override
  List<Object> get props => [];
}

final class LocalStorageInitial extends LocalStorageState {}

class UserControlling extends LocalStorageState{}

class UserExist extends LocalStorageState{
  final String userId;

  const UserExist(this.userId); 
}

class NoUser extends LocalStorageState {}
