part of 'search_page_bloc.dart';

sealed class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class SearchUser extends SearchPageEvent {
  final String searchName;

  const SearchUser(this.searchName);
}

class SearchPageClearEvent extends SearchPageEvent {}
