import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssetImage extends StatelessWidget {
  const AppAssetImage(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
  });

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (assetName.endsWith('.svg')) {
      final localColor = color;

      return SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: localColor != null
            ? ColorFilter.mode(localColor, BlendMode.srcIn)
            : null,
      );
    }

    return Image.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
