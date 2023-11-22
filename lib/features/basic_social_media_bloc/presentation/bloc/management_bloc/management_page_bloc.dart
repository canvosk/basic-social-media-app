import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'management_page_event.dart';
part 'management_page_state.dart';

class ManagementPageBloc
    extends Bloc<ManagementPageEvent, ManagementPageState> {
  ManagementPageBloc() : super(ManagementPageInitial()) {
    on<ChangeSelectedPage>((event, emit) {
      try {
        emit(CurrentPageChanged(event.index, event.content));
      } catch (e) {
        debugPrint(e.toString());
        emit(FailedChanging());
      }
    });
  }
}
