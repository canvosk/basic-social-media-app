part of 'management_page_bloc.dart';

sealed class ManagementPageEvent extends Equatable {
  const ManagementPageEvent();

  @override
  List<Object> get props => [];
}

class ChangeSelectedPage extends ManagementPageEvent {
  final int index;
  final Widget content;

  const ChangeSelectedPage(this.index, this.content);
}
