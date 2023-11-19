import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/local_storage_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'local_storage_event.dart';
part 'local_storage_state.dart';

class LocalStorageBloc extends Bloc<LocalStorageEvent, LocalStorageState> {
  final LocalStorageUseCase _localStorageUseCase;

  LocalStorageBloc(this._localStorageUseCase) : super(LocalStorageInitial()) {
    on<GetString>((event, emit) async {
      emit(UserControlling());
      try {
        String userId = await _localStorageUseCase.getValue(
          key: event.key,
        );
        debugPrint(userId.toString());
        if (userId == "") {
          emit(NoUser());
          return;
        }
        emit(UserExist(userId));
      } catch (e) {
        debugPrint(e.toString());
        emit(NoUser());
      }
    });
    on<SetString>((event, emit) async {
      try {
        bool isDone = await _localStorageUseCase.setValue(
            key: event.key, value: event.value);
        isDone ? emit(UserExist(event.value)) : emit(NoUser());
      } catch (e) {
        debugPrint(e.toString());
        emit(NoUser());
      }
    });
    on<RemoveValue>((event, emit) async {
      try {
        await _localStorageUseCase.removeValue(key: event.key);

        emit(NoUser());
      } catch (e) {
        debugPrint(e.toString());
        emit(NoUser());
      }
    });
  }
}
