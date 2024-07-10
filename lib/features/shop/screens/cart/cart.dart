import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';

import 'package:fro9/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:fro9/features/shop/screens/checkout/checkout.dart';

import 'package:fro9/utils/constants/sizes.dart';

import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TCartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => ChekoutScreen()),
            child: Text('Chekout \$215')),
      ),
    );
  }
}
