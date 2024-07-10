import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/appbar/appbar.dart';
import 'package:fro9/common/widgets/products/product_card/ratings/rating_indicator.dart';
import 'package:fro9/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:fro9/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:fro9/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Reviews& Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Reviews are verified and are from  people tha use the same product as you"),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TOverallProductRating(),
              TRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                '12,616',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
