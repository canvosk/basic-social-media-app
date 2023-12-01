import 'package:image_picker/image_picker.dart';

class ImagePickerServices {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> takeImage({required ImageSource source}) async {
    return await _picker.pickImage(source: source);
  }
}
