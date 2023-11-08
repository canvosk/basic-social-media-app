import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';

class RegisterUseCase implements UseCase<UserEntitiy,UserEntitiy>{

  final AuthenticationRepository _authenticationRepository;

  const RegisterUseCase(this._authenticationRepository);

  @override
  Future<UserEntitiy> call({required UserEntitiy params}) {
    return _authenticationRepository.register(params);
  }
  
}