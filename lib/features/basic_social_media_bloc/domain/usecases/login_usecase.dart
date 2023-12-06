import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';

class LoginUseCase implements UseCase<UserEntity, UserEntity> {
  final AuthenticationRepository _authenticationRepository;

  const LoginUseCase(this._authenticationRepository);

  @override
  Future<UserEntity> call({required UserEntity params}) {
    return _authenticationRepository.login(myUser: params);
  }
}
