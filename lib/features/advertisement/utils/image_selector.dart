
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector {
  static Future<File?> selectImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    print(image!.path);
    return File(image!.path);
  }
}