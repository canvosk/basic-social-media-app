import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/user_repository.dart';

class UserUseCase implements UseCase<UserEntitiy, String> {
  final UserRepository _userRepository;

  const UserUseCase(this._userRepository);

  @override
  Future<UserEntitiy> call({required String params}) {
    return _userRepository.getUserInformation(userId: params);
  }
}
