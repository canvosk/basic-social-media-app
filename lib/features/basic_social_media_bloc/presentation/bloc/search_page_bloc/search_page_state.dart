part of 'search_page_bloc.dart';

sealed class SearchPageState extends Equatable {
  const SearchPageState();

  @override
  List<Object> get props => [];
}

final class SearchPageClear extends SearchPageState {}

class SearchingUser extends SearchPageState {}

class SearchSuccess extends SearchPageState {
  final List<UserEntitiy> searchedUsers;

  const SearchSuccess(this.searchedUsers);

  @override
  List<Object> get props => [searchedUsers];
}

class SearchEmpty extends SearchPageState {}

class SearchFailed extends SearchPageState {}
