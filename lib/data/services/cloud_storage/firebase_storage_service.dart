import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();
  final _firebaseStorage = FirebaseStorage.instance;
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      print("Bdinaaa :");
      final byteData = await rootBundle.load(path);
      print(byteData);
      print(" \n Fotna: ");
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      print("\n Zedna fotna");

      return imageData;
    } catch (e) {
      throw 'Error loading image data : $e';
    }
  }

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      print('bdina upload image data: ');
      final ref = _firebaseStorage.ref(path).child(name);
      print(ref);
      print("\n eli baadou: ");
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'PLatform =Exception: ${e.message}';
      } else {
        throw 'Something went wtong try again';
      }
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'PLatform =Exception: ${e.message}';
      } else {
        throw 'Something went wtong try again';
      }
    }
  }
}
