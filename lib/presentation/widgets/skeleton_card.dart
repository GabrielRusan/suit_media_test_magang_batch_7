import 'package:flutter/material.dart';
import 'package:suit_media_test_app/constants/assets.dart';
import 'package:suit_media_test_app/styles/color_style.dart';
import 'package:suit_media_test_app/styles/text_style_widget.dart';

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(Assets.assetsImagesPhoto1), fit: BoxFit.cover),
        ),
      ),
      title: Text(
        'nama panjang panjang',
        style: TextStyleWidget.h3(),
      ),
      subtitle: Text(
        'email panjang panjang',
        style: TextStyleWidget.h5(color: ColorStyle.greyDark),
      ),
    );
  }
}
