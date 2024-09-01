import 'package:flutter/material.dart';
import 'package:fro9/common/widgets/images/t_circular_image.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/image_strings.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.image = TImages.sportIcon,
    this.title = 'Shoes categorie',
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
            ),
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //       color: backgroundColor,
            //       borderRadius: BorderRadius.circular(100)),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: TColors.dark,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  maxLines: 1,
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
