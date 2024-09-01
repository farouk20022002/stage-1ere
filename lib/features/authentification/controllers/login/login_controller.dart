import 'package:flutter/widgets.dart';
import 'package:fro9/data/repositories/authentication_repository.dart';
import 'package:fro9/utils/popups/fullscreen_loader.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final remember = false.obs;
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL') != null)
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
    if (localStorage.read('REMEMBER_ME_PASSWORD') != null)
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailPasswordSignIn() async {
    print("suppose tbda tekhdem w");
    try {
      print("Hana d5alna Nverifiw");

      if (!loginFormKey.currentState!.validate()) {
        return;
      }
      if (remember.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      print("bch nabdew fl authentification");
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      print("kamalna l auth");

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

      // TLoader.successSnackBar(
      //     title: 'Congratulations',
      //     message: 'Your account has been created! Verify email to continue.');
      // Get.to(() => VerifyEmailScreen(
      //       email: email.text.trim(),
      //     ));
    } catch (e) {
      print("Fama erreur");
      TFullScreenLoader.stopLoading();

      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
    // finally {
    // }
  }
}
