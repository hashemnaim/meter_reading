import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetDetailsReadProfileUser extends StatelessWidget {
  const WidgetDetailsReadProfileUser(
      {super.key,
      required this.date,
      required this.accountNo,
      required this.machenNo,
      required this.lastread});
  final String date, accountNo, machenNo, lastread;

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
        SizedBox(
          child: Text(text,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: fontSize, color: colorText)),
        ),
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
              child: SizedBox(
                  width: 500.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            color: LightThemeColors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: CustomSvg(
                            ImagePaths.calendarRange,
                          ),
                        ),
                      ),
                      const SpaceW8(),
                      SizedBox(
                        width: 280.w,
                        child: Text(date,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Colors.black)),
                      ),
                    ],
                  ))),
          const SpaceH12(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const SpaceW12(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: textIcon(icon: ImagePaths.school2, text: accountNo),
              ),
              textIcon(icon: ImagePaths.projector, text: machenNo),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: textIcon(
                    icon: ImagePaths.newspaper,
                    text: lastread,
                    colorText: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
