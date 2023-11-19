import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/local_storage_repository.dart';

class LocalStorageUseCase {
  final LocalStorageRepository _localStorageRepository;

  const LocalStorageUseCase(this._localStorageRepository);

  Future<String> getValue({required String key}) async {
    return _localStorageRepository.getString(key: key);
  }

  Future<bool> setValue({required String key, required String value}) async {
    return _localStorageRepository.setString(key: key, value: value);
  }

  Future<bool> removeValue({required String key}) async {
    return _localStorageRepository.removeValue(key: key);
  }
}
