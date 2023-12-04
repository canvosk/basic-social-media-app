part of 'search_page_bloc.dart';

sealed class SearchPageState extends Equatable {
  const SearchPageState();

  @override
  List<Object> get props => [];
}

final class SearchPageClear extends SearchPageState {}

class SearchingUser extends SearchPageState {}

class SearchSuccess extends SearchPageState {}

class SearchEmpty extends SearchPageState {}

class SearchFailed extends SearchPageState {}



