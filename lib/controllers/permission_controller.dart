//flutter
import 'dart:async';
//packages
import 'package:credit_app/views/Login/login_screen.dart';
import 'package:credit_app/views/Permission/permission_screen.dart';
import 'package:get/get.dart';
//controllers
import 'package:permission_handler/permission_handler.dart';
import 'package:credit_app/utils/global.dart' as global;

class PermissionController extends GetxController {
  bool smaDone = false.obs();
  bool contactDone = false.obs();
  bool storageDone = false.obs();
  bool locationDone = false.obs();
  bool cameraDone = false.obs();

  @override
  void onInit() async {
    _init();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _init() {
    takeAllPermission();
  }

  Future<void> takeAllPermission() async {
    await _checkcamarePermission();
    await _checkstoragePermission();
    await _checkcontactPermission();
    await _checklocPermission();
    await _checkSmsPermission();
  }

  void checkAllPermissionForNavigation() async {
    await takeAllPermission();
    if (global.smaDone && global.contactDone && global.locationDone && global.storageDone && global.cameraDone) {
      Get.to(() => LoginScreen());
    } else {
      Get.to(() => PermissionScreen());
    }
  }

  void checkAllPermission() async {
    if (global.smaDone && global.contactDone && global.locationDone && global.storageDone && global.cameraDone) {
      Get.to(() => LoginScreen());
    } else {
      takeAllPermission();
    }
  }

  Future<void> _checklocPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      global.locationDone = true;
      update();
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> _checkcontactPermission() async {
    final status = await Permission.contacts.request();
    if (status == PermissionStatus.granted) {
      global.contactDone = true;
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> _checkstoragePermission() async {
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      global.storageDone = true;
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> _checkSmsPermission() async {
    final status = await Permission.sms.request();
    if (status == PermissionStatus.granted) {
      global.smaDone = true;
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> _checkcamarePermission() async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      global.cameraDone = true;
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }
}
