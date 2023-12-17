import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class FollowerBlocEntity extends Equatable {
  final UserEntity user;
  final bool isRemoved;
  final bool isCurrent;

  const FollowerBlocEntity({
    required this.user,
    required this.isRemoved,
    required this.isCurrent,
  });

  static const empty = FollowerBlocEntity(
    user: UserEntity.empty,
    isRemoved: false,
    isCurrent: false,
  );

  FollowerBlocEntity copyWith({
    UserEntity? user,
    bool? isRemoved,
    bool? isCurrent,
  }) {
    return FollowerBlocEntity(
      user: user ?? this.user,
      isRemoved: isRemoved ?? this.isRemoved,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  @override
  List<Object?> get props => [user, isRemoved, isCurrent];
}
