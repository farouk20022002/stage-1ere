import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fro9/common/widgets/products/cart/coupon_wwidget.dart';
import 'package:fro9/common/widgets/success_screen/success_screen.dart';
import 'package:fro9/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:fro9/features/shop/screens/checkout/widhets/billing_address_section.dart';
import 'package:fro9/features/shop/screens/checkout/widhets/billing_amount_section.dart';
import 'package:fro9/features/shop/screens/checkout/widhets/billing_payment_section.dart';
import 'package:fro9/navigation_menu.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ChekoutScreen extends StatelessWidget {
  const ChekoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TCartItems(
                showAddRemoveButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TCouponCode(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TRoundedContainer(
                padding: EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment Success!',
                  subTitle: 'Your Item Will Be shipped Soon!',
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                )),
            child: Text('Chekout \$215')),
      ),
    );
  }
}
