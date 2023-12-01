import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/image_picker_services.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRepositoryImp implements ImagePickerRepository {
  final ImagePickerServices _imagePickerServices;

  const ImagePickerRepositoryImp(this._imagePickerServices);

  @override
  Future<XFile?> takeImage({required ImageSource source}) async {
    return await _imagePickerServices.takeImage(source: source);
  }
}
