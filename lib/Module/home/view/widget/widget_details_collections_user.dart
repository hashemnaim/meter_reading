import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetDetailsCollectionsUser extends StatelessWidget {
  const WidgetDetailsCollectionsUser(
      {super.key,
      required this.name,
      required this.dateTime,
      required this.price});

  final String name, price, dateTime;
  Row textIcon(
      {required String icon,
      required String text,
      Color colorText = Colors.black,
      double fontSize = 14}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              color: LightThemeColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomSvg(
              icon,
            ),
          ),
        ),
        const SpaceW8(),
        Text(text,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: fontSize, color: colorText)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 104,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.white),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 2),
                spreadRadius: 0,
                blurRadius: 12,
                color: const Color(0xff111827).withOpacity(0.2))
          ],
          color: LightThemeColors.white,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceH8(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: textIcon(icon: ImagePaths.user, text: name, fontSize: 16),
          ),
          const SpaceH12(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const SpaceW12(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: textIcon(
                    icon: ImagePaths.circleDollar,
                    text: "$price شيكل",
                    colorText: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                ),
                child: textIcon(
                  icon: ImagePaths.calendarRange,
                  text: dateTime.substring(0, 10).toString(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
