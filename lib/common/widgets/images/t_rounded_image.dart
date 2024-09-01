import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:fro9/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.widht,
    this.height,
    required this.imageURl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });
  final double? widht, height;
  final String imageURl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: widht,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageURl,
                    fit: fit,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Image(
                    fit: fit, image: AssetImage(imageURl) as ImageProvider)),
      ),
    );
  }
}
