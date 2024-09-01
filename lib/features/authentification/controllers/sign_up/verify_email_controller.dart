import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fro9/common/widgets/success_screen/success_screen.dart';
import 'package:fro9/data/repositories/authentication_repository.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/constants/text_strings.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: "Please check your inbox to verify your account");
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final User = FirebaseAuth.instance.currentUser;
      if (User?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect),
      );
    }
  }
}
