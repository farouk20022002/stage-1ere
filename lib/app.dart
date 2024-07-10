import 'package:flutter/material.dart';
import 'package:fro9/binfings/general_bindings.dart';
import 'package:fro9/features/authentification/screens/login/login.dart';
import 'package:fro9/features/authentification/screens/onboarding/onboarding.dart';
import 'package:fro9/utils/constants/colors.dart';

import 'package:fro9/utils/constants/text_strings.dart';
import 'package:fro9/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // initialBinding: GeneralBindings(),
      home: Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
// deviceStorage.read('isFirstTime') != true
//             ? LoginScreen()
//             : OnBoardingScreen());