import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageController {
  final ImagePicker _picker = ImagePicker();
//갤러리 사용 이미지 선택
  Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final File? croppedImage = await _cropImage(image);
        return croppedImage != null
            ? XFile(croppedImage.path)
            : null; //XFile로 변환
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
    return null;
  }

//카메라 사용 이미지 선택
  Future<XFile?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        final File? croppedImage = await _cropImage(image);
        return croppedImage != null
            ? XFile(croppedImage.path)
            : null; //XFile로 변환
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
    return null;
  }

//Crop image
  Future<File?> _cropImage(XFile image) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100, //이미지 품질
      );
      return croppedFile != null ? File(croppedFile.path) : null;
    } catch (e) {
      print('Error cropping image: $e');
      return null;
    }
  }

  //이미지 삭제
  Future<void> deleteImage(String path) async {
    try {
      final File file = File(path); //파일 경로 지정
      if (file.existsSync()) {
        await file.delete();
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }
}


// 사용방법

// ImageController _picker = ImageController();
// Image? _selectedImage;

// IconButton(
//               icon: Icon(Icons.camera_alt),
//               onPressed: () async {
//                 _picker.pickImageFromGallery();
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.photo),
//               onPressed: () async {
//                 final XFile? pickedImage = await _picker.pickImageFromGallery();
//                 if (pickedImage != null) {
//                   setState(() {
//                     _selectedImage = Image.file(File(pickedImage.path));
//                   });
//                 }
//               },
//             ),
//             if (_selectedImage != null) _selectedImage!