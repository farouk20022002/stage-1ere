import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/primary_header-container.dart';
import 'package:fro9/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/data/repositories/authentication_repository.dart';
import 'package:fro9/features/personalization/screens/adress/address.dart';
import 'package:fro9/features/personalization/screens/settings/settings_menu_tile.dart';
import 'package:fro9/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:fro9/features/shop/screens/order/orders.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderController(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TUserProfileTile(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    showActionButton: false,
                    title: 'Account Settings',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    title: 'My Adress',
                    subTitle: 'Set Shopping Delivery Adress',
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    title: 'My Cart',
                    subTitle: 'Add,Remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onTap: () => Get.to(() => TCartItems()),
                  ),
                  TSettingsMenuTile(
                    title: 'My Orders',
                    subTitle: 'In progress and Completed Orders',
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  const TSettingsMenuTile(
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to register bank account',
                      icon: Iconsax.bank),
                  const TSettingsMenuTile(
                      title: 'My Coupons',
                      subTitle: 'List of all the Discounted Coupons',
                      icon: Iconsax.discount_shape),
                  const TSettingsMenuTile(
                      title: 'Notifications',
                      subTitle: 'Set any kind of Notification message',
                      icon: Iconsax.notification),
                  const TSettingsMenuTile(
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and  connected accounts',
                      icon: Iconsax.security_card),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSettingsMenuTile(
                      title: 'Load Data',
                      subTitle: 'Upload data to your cloud firebase ',
                      icon: Iconsax.document_upload),
                  TSettingsMenuTile(
                    title: 'Geolocation',
                    subTitle: 'Set Recommendation based on location',
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                      title: 'Safe Mode',
                      subTitle: 'Search  result  is safe for all ages ',
                      trailing: Switch(value: false, onChanged: (value) {}),
                      icon: Iconsax.security_user),
                  TSettingsMenuTile(
                    title: 'Hd image quality',
                    subTitle: 'Set Image quality to be seen',
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  FloatingActionButton(
                    onPressed: () => AuthenticationRepository.instance.logout(),
                    child: Text("Logout"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
