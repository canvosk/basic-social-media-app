

import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/local_storage_services.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/local_storage_repository.dart';

class LocalStorageRepositoryImp implements LocalStorageRepository{

  final LocalStorageService _localStorageService;

  const LocalStorageRepositoryImp(this._localStorageService);

  @override
  Future<String> getString({required String key}) async{
    return _localStorageService.getString(key: key);
  }
  
  @override
  Future<bool> setString({required String key, required String value}) {
    return _localStorageService.setString(key: key, value: value);
  }
  
  @override
  Future<bool> removeValue({required String key}) {
    return _localStorageService.removeValue(key: key);
  }

}