part of 'local_storage_bloc.dart';

sealed class LocalStorageEvent extends Equatable {
  const LocalStorageEvent();

  @override
  List<Object> get props => [];
}

class GetString extends LocalStorageEvent {
  final String key;

  const GetString(this.key);
}

class SetString extends LocalStorageEvent {
  final String key;
  final String value;

  const SetString(this.key, this.value);
}

class RemoveValue extends LocalStorageEvent {
  final String key;

  const RemoveValue(this.key);
}
