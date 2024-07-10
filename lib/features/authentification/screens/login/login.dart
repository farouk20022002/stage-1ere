import 'package:flutter/material.dart';
import 'package:fro9/common/styles/spacing_styles.dart';
import 'package:fro9/common/widgets/login_signup/form_divider.dart';
import 'package:fro9/common/widgets/login_signup/social_buttons.dart';
import 'package:fro9/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import 'widgets/TLoginForm.dart';
import 'widgets/tlogin_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TLoginHeader(),
              const TLoginForm(),
              TFormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
