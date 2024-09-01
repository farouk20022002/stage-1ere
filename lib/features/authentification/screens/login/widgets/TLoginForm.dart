import 'package:flutter/material.dart';
import 'package:fro9/data/repositories/authentication_repository.dart';
import 'package:fro9/features/authentification/controllers/login/login_controller.dart';
import 'package:fro9/features/authentification/screens/password/configuration/forget_password.dart';
import 'package:fro9/navigation_menu.dart';
import 'package:fro9/utils/popups/fullscreen_loader.dart';
import 'package:fro9/utils/popups/tloader.dart';
import 'package:fro9/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Obx(
                () => TextFormField(
                    validator: (Value) => TValidator.validatePassword(Value),
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)),
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.remember.value,
                          onChanged: (value) => controller.remember.value =
                              !controller.remember.value)),
                      const Text(TTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(TTexts.forgetPassword))
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        print("hak nzelt ala sign in");

                        print("suppose tbda tekhdem w");
                        try {
                          print("Hana d5alna Nverifiw");

                          if (!controller.loginFormKey.currentState!
                              .validate()) {
                            print("erreur");
                            return;
                          }
                          if (controller.remember.value) {
                            controller.localStorage.write('REMEMBER_ME_EMAIL',
                                controller.email.text.trim());
                            controller.localStorage.write(
                                'REMEMBER_ME_PASSWORD',
                                controller.password.text.trim());
                          }
                          print("bch nabdew fl authentification");
                          final userCredentials = await AuthenticationRepository
                              .instance
                              .loginWithEmailAndPassword(
                                  controller.email.text.trim(),
                                  controller.password.text.trim());
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
                          // TFullScreenLoader.stopLoading();

                          TLoader.errorSnackBar(
                              title: 'Oh Snap', message: e.toString());

                          // finally {
                          // }
                        }
                        print("hak nzelt ala sign in");
                      },
                      child: const Text(TTexts.signIn))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => SignUpScreen()),
                      child: const Text(TTexts.createAccount))),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ));
  }
}
