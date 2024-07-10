import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fro9/common/widgets/texts/product_price_text.dart';
import 'package:fro9/common/widgets/texts/product_title_text.dart';
import 'package:fro9/common/widgets/texts/section_heading.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
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
                              smallSize: false,
                            ),
                            SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            Text(
                              '\$25',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            TProductPriceText(price: '20')
                          ],
                        ),
                        Row(
                          children: [
                            TProductTitleWidget(
                              title: 'Stock :',
                              smallSize: false,
                            ),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TProductTitleWidget(
                title: 'This is the description of the product',
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
          children: [
            TSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TChoiceChip(
                  text: 'Red',
                  selected: true,
                  onSelected: (value) {},
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            Wrap(
              spacing: 8,
              children: [
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TChoiceChip(
                  text: 'EU 34',
                  selected: false,
                  onSelected: (value) {},
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TChoiceChip(
                  text: 'EU 38',
                  selected: true,
                  onSelected: (value) {},
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
