import 'package:flutter/material.dart';
import 'package:fro9/features/authentification/controllers/onboarding/onboarding_controller.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text('skip'),
        ));
  }
}
