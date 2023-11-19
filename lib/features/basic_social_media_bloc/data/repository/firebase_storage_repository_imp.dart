import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/firebase_storage_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/firebase_storage_repository.dart';

class FirebaseStorageRepositoryImp implements FirebaseStorageRepository {
  final FirebaseStorageService _firebaseStorageService;

  const FirebaseStorageRepositoryImp(this._firebaseStorageService);

  @override
  Future<String> getUnknownImageUrl() {
   return _firebaseStorageService.getUnknownImageUrl();
  }
}
