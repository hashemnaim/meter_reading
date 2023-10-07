import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_button.dart';

class WidgeFatooraUser extends StatelessWidget {
  const WidgeFatooraUser({
    super.key,
    required this.name,
    required this.read1,
    required this.index,
  });

  final String? name;
  final String? read1;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 80,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SpaceH8(),
                Text(name!, style: Theme.of(Get.context!).textTheme.bodyLarge!),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(read1!,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: LightThemeColors.primaryColor)),
                    Text(" شيكل",
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodyMedium!
                            .copyWith()),
                  ],
                ),
              ],
            ),
            const Spacer(),
            (index! % 2) != 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 85,
                      child: CustomTextButton(
                        text: 'مُحصل',
                        isOutlined: true,
                        background: true,
                        color: LightThemeColors.primaryColor,
                        onPress: () {},
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 85,
                      child: CustomTextButton(
                        text: 'غير مُحصل',
                        isOutlined: true,
                        background: true,
                        color: Colors.red,
                        onPress: () {},
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
