// ignore_for_file: use_key_in_widget_constructors
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String? text;
  final BoxFit? fit;
  final Color? color;
  final double height;
  final bool isColor;
  final double width;

  const CustomSvg(this.text,
      {this.color = Colors.white,
      this.height = 25,
      this.width = 25,
      this.fit = BoxFit.contain,
      this.isColor = false});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "${ImagePaths.svgPath}$text.svg",
      height: height,
      width: width,
      color: isColor == false ? null : color,
      fit: fit!,
    );
  }
}

class CustomAssetsImage extends StatelessWidget {
  final String text;
  final Color color;
  final bool isColor;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomAssetsImage(
    this.text, {
    this.color = Colors.white,
    this.isColor = false,
    this.height = 100,
    this.width = 100,
    this.fit = BoxFit.contain,
  });
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      text,
      height: height,
      width: width,
      fit: fit,
      color: isColor == false ? null : color,
    );
  }
}
