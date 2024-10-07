import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';
//models
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
      if (_selectedImage != null) {
        imageFile = File(_selectedImage.path);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        print(imageBytes);
        imagePath.value = base64Encode(imageBytes);
        update();

        return imageFile!;
      }
    } catch (e) {
      print("Exception - imageService()" + e.toString());
    }
    return null;
  }
}
