import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/login_signup/form_divider.dart';
import 'package:fro9/common/widgets/login_signup/social_buttons.dart';
import 'package:fro9/features/authentification/screens/signup/widgets/signup_form.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/constants/text_strings.dart';
import 'package:get/get_utils/get_utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const TSignupForm(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSocialButtons(),
              ],
            )),
      ),
    );
  }
}
