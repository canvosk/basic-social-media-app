import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final UserUseCase _userUseCase;

  SearchPageBloc(this._userUseCase) : super(SearchPageClear()) {
    on<SearchUser>((event, emit) async {
      emit(SearchingUser());
      try {
        await _userUseCase.searchUser(searchName: event.searchName);
        emit(SearchSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(SearchFailed());
      }
    });
  }
}