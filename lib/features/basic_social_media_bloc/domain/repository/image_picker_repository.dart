import 'package:image_picker/image_picker.dart';

abstract class ImagePickerRepository {
  Future<XFile?> takeImageFromCamera();

  Future<XFile?> takeImageFromGallery();
}
