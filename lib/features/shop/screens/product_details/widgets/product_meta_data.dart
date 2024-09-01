import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/images/t_circular_image.dart';
import 'package:fro9/common/widgets/texts/product_price_text.dart';
import 'package:fro9/common/widgets/texts/product_title_text.dart';
import 'package:fro9/common/widgets/texts/t_brand_title_text_with_verification_icon.dart';
import 'package:fro9/features/shop/controllers/product/product_controlelr.dart';
import 'package:fro9/features/shop/enums/enums.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/utils/constants/enums.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              width: 45,
              height: 25,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.salePrice}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        TProductTitleWidget(title: product.title),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            TProductTitleWidget(title: 'Status:'),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : "",
              widht: 30,
              height: 30,
              overlayColor: darkMode ? TColors.white : TColors.dark,
            ),
            TBrandTitleWithVerificationIcon(
              title: product.brand != null ? product.brand!.name : "",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
