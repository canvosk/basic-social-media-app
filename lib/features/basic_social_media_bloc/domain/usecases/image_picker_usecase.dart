import 'package:basic_social_media_app/core/usecase/usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUseCase implements UseCase<XFile?, ImageSource> {
  final ImagePickerRepository _imagePickerRepository;

  const ImagePickerUseCase(this._imagePickerRepository);

  @override
  Future<XFile?> call({required ImageSource params}) async {
    return await _imagePickerRepository.takeImage(source: params);
  }
}
