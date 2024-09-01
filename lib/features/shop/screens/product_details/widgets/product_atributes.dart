import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fro9/common/widgets/texts/product_price_text.dart';
import 'package:fro9/common/widgets/texts/product_title_text.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/features/shop/controllers/product/variation_controller.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkGrey : TColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TSectionHeading(
                          title: 'Variation',
                          showActionButton: false,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TProductTitleWidget(
                                  title: 'Price :',
                                  smallSize: true,
                                ),
                                SizedBox(
                                  width: TSizes.spaceBtwItems,
                                ),
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    '\$${controller.selectedVariation.value.salePrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                SizedBox(
                                  width: TSizes.spaceBtwItems,
                                ),
                                TProductPriceText(
                                    price: controller.getVariationPrice())
                              ],
                            ),
                            Row(
                              children: [
                                TProductTitleWidget(
                                  title: 'Stock :',
                                  smallSize: true,
                                ),
                                Text(
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TProductTitleWidget(
                    title: controller.selectedVariation.value.description ??
                        "no description yet",
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: attribute.name ?? "title misssing",
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInvariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);

                            return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? "",
                                              attributeValue);
                                        }
                                      }
                                    : null);
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
