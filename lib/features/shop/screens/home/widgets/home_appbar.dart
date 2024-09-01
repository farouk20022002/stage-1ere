import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';
import 'package:fro9/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:fro9/features/personalization/controllers/user_controller.dart';
import 'package:fro9/features/shop/screens/cart/cart.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class THomeBar extends StatelessWidget {
  const THomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () => Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
          )
        ],
      ),
      actions: [
        TCartCountericon(
          onPressed: () => Get.to(() => CartScreen()),
        )
      ],
    );
  }
}
