import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/products/cart/add_reomve_button.dart';
import 'package:fro9/common/widgets/products/cart/cart_item.dart';
import 'package:fro9/common/widgets/texts/product_price_text.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/device/device_utility.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                TCartItem(),
                if (showAddRemoveButton)
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: TDeviceUtils.getScreenWidth(context) / 3,
                          ),
                          TProductQuantityWithAddRemoveButton(),
                        ],
                      ),
                      TProductPriceText(price: '212')
                    ],
                  ),
              ],
            ),
        separatorBuilder: (_, __) => SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
