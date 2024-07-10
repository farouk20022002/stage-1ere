import 'package:flutter/material.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/helpers/network_manager.dart';
import 'package:fro9/utils/popups/fullscreen_loader.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  // final showPassword = true.obs;
  // final email = TextEditingController();
  // final userName = TextEditingController();
  // final lastName = TextEditingController();
  // final firstName = TextEditingController();
  // final password = TextEditingController();
  // final phoneNumber = TextEditingController();
  // GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Future<void> signup() async {
  //   try {
  //     print("Hana d5alna Nverifiw");
  //     TFullScreenLoader.openLoadingDialog(
  //         'We are processing your information.....',
  //         TImages.verifyIllustration);
  //     final isConnected = await NetworkManager.instance.isConnected();

  //     if (!isConnected) {
  //       TFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     // if (!signupFormKey.currentState!.validate()) {
  //     //   TFullScreenLoader.stopLoading();
  //     //   return;
  //     // }
  //   } catch (e) {
  //     TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
  //   } finally {
  //     TFullScreenLoader.stopLoading();
  //   }
  // }
}
