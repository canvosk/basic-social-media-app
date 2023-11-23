part of 'management_page_bloc.dart';

sealed class ManagementPageState extends Equatable {
  const ManagementPageState();

  @override
  List<Object> get props => [];
}

final class ManagementPageInitial extends ManagementPageState {}

final class CurrentPageChanged extends ManagementPageState {
  final int index;
  final Widget content;

  const CurrentPageChanged(this.index, this.content);

  @override
  List<Object> get props => [index, content];
}

final class FailedChanging extends ManagementPageState {}
 