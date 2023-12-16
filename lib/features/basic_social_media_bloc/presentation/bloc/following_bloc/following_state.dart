part of 'following_bloc.dart';

sealed class FollowingState extends Equatable {
  const FollowingState();
  
  @override
  List<Object> get props => [];
}

final class FollowingInitial extends FollowingState {}
