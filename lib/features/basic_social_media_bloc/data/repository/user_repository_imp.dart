import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/user_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/models/user_model.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserService _userService;

  const UserRepositoryImp(this._userService);

  @override
  Future<UserModel> getUserInformation({required String userId}) {
    return _userService.getUserInformation(userId: userId);
  }
}
