import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/sizes.dart';
import 'package:fro9/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.widht = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = true,
    this.overlayColor,
    this.backgroundColor,
  });
  final double widht, height, padding;
  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          color: backgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: isNetworkImage
          ? CachedNetworkImage(
              fit: fit,
              color: overlayColor,
              imageUrl: image,
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          : Image(
              fit: fit,
              image: AssetImage(image),
              color: overlayColor,
            ),
    );
  }
}
