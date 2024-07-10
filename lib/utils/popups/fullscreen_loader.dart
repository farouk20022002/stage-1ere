import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/loaders/animation_loader.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    print("ahna tawa f openLoadingDialog");
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (context) => PopScope(
              canPop: false,
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!)
                    ? TColors.dark
                    : Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    TAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
