import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/images/t_circular_image.dart';
import 'package:fro9/common/widgets/texts/product_price_text.dart';
import 'package:fro9/common/widgets/texts/product_title_text.dart';
import 'package:fro9/common/widgets/texts/t_brand_title_text_with_verification_icon.dart';
import 'package:fro9/utils/constants/enums.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '\$250.0',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TProductPriceText(price: '170.0')
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        TProductTitleWidget(title: 'Green Nike  Sports  Shirt'),
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
              'In Stock',
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
              image: TImages.nikeLogo,
              widht: 30,
              height: 30,
              overlayColor: darkMode ? TColors.white : TColors.dark,
            ),
            TBrandTitleWithVerificationIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
