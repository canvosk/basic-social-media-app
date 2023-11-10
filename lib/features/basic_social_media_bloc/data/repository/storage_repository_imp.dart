import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/storage_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/storage_repository.dart';

class StorageRepositoryImp implements StorageRepository {
  final StorageService _storageService;

  const StorageRepositoryImp(this._storageService);

  @override
  Future<String> getUnknownImageUrl() {
   return _storageService.getUnknownImageUrl();
  }
}
