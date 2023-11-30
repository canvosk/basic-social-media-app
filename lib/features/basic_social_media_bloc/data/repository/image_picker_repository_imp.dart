import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/image_picker_repository.dart';
import 'package:cross_file/src/types/interface.dart';

class ImagePickerRepositoryImp implements ImagePickerRepository{
  @override
  Future<XFile?> takeImageFromCamera() {
    // TODO: implement takeImageFromCamera
    throw UnimplementedError();
  }

  @override
  Future<XFile?> takeImageFromGallery() {
    // TODO: implement takeImageFromGallery
    throw UnimplementedError();
  }
}