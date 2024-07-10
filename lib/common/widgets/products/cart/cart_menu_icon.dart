import 'package:flutter/material.dart';
import 'package:fro9/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class TCartCountericon extends StatelessWidget {
  const TCartCountericon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor ?? TColors.white,
            )),
        Positioned(
          right: 1,
          top: 2,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black, borderRadius: BorderRadius.circular(100)),
            child: const Center(
              child: Text(
                "2",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
