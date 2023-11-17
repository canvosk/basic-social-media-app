import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';

class LoginUseCase implements UseCase<UserEntitiy, UserEntitiy> {
  final AuthenticationRepository _authenticationRepository;

  const LoginUseCase(this._authenticationRepository);

  @override
  Future<UserEntitiy> call({required UserEntitiy params}) {
    return _authenticationRepository.login(myUser: params);
  }
}
