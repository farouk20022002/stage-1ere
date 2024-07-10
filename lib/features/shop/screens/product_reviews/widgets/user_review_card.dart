import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fro9/common/widgets/products/product_card/ratings/rating_indicator.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(TImages.userProfileImage2),
              ),
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                'John seena',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ]),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'Le produit est excellent mais il y a un probleme de connexion ',
          trimLines: 2,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SCSi Consultant ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '14 Nov 2023 ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                ReadMoreText(
                  'Le produit est excellent mais il y a un probleme de connexion ',
                  trimLines: 2,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        )
      ],
    );
  }
}
