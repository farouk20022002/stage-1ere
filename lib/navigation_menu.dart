import 'package:flutter/material.dart';
import 'package:fro9/features/personalization/screens/settings/settings.dart';
import 'package:fro9/features/shop/screens/store/store.dart';
import 'package:fro9/features/shop/screens/wishlist/wishlist.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 20,
          backgroundColor: darkMode ? TColors.black : TColors.textWhite,
          selectedIndex: controller.selectedIndex.value,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: TColors.darkerGrey,
              ),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(
                  Iconsax.shop,
                  color: TColors.darkerGrey,
                ),
                label: 'Shop'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.heart,
                  color: TColors.darkerGrey,
                ),
                label: 'Heart'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.user,
                  color: TColors.darkerGrey,
                ),
                label: 'User'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScrenn(),
    const FavoriteScreen(),
    const SettingsScreen()
  ];
}
