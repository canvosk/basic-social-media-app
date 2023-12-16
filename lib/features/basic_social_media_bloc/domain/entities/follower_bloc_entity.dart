import 'package:equatable/equatable.dart';

class FollowerBlocEntity extends Equatable {
  final String userId;
  final bool isRemoved;
  final bool isCurrent;

  const FollowerBlocEntity({
    required this.userId,
    required this.isRemoved,
    required this.isCurrent,
  });

  static const empty = FollowerBlocEntity(
    userId: "",
    isRemoved: false,
    isCurrent: false,
  );

  FollowerBlocEntity copyWith({
    String? userId,
    bool? isRemoved,
    bool? isCurrent,
  }) {
    return FollowerBlocEntity(
      userId: userId ?? this.userId,
      isRemoved: isRemoved ?? this.isRemoved,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  @override
  List<Object?> get props => [userId, isRemoved, isCurrent];
}
