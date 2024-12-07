import 'dart:io';
import 'package:image_picker/image_picker.dart';

///pick image from gallery
Future<File?> picImageFromGallery() async {
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

///pick image from camera
Future<File?> picImageFromCamera() async {
  try {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
