//flutter
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';
//models
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageControlller extends GetxController {
  static ImageControlller get i => Get.find();
  ScrollController scrollController = ScrollController();

  //variables
  var imagePath = ''.obs;
  var isAvailbale = true.obs;
  File? imageFile;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetImageValue() {
    imagePath.value = '';
  }

  Future<File?> imageService(ImageSource imageSource) async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? _selectedImage = await _picker.pickImage(source: imageSource);
      imageFile = File(_selectedImage!.path);
      // if (_selectedImage != null) {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: _selectedImage.path,
        androidUiSettings: AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.ratio4x3,
          backgroundColor: Colors.grey,
          toolbarColor: Colors.grey[100],
          toolbarWidgetColor: Colors.blue[200],
          activeControlsWidgetColor: Colors.blue[200],
          cropFrameColor: Colors.blue[200],
        ),
      );

      if (croppedFile != null) {
        imageFile = croppedFile;
        List<int> imageBytes = imageFile!.readAsBytesSync();
        print(imageBytes);
        imagePath.value = base64Encode(imageBytes);
        update();

        return imageFile!;
      }
      // }
    } catch (e) {
      print("Exception - businessRule.dart - _openGallery()" + e.toString());
    }
    return null;
  }
}
