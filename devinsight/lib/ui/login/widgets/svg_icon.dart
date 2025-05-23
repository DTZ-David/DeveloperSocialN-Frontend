import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double height;
  final double width;
  final Color? color;

  const SvgIcon({
    super.key,
    required this.assetName,
    required this.height,
    required this.width,
    this.color = const Color(0xFF1ABCFE),
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
