import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/config/routes/routes.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetAppBarScreen extends StatelessWidget {
  const WidgetAppBarScreen({
    super.key,
    required this.title,
    this.actions = false,
    this.isHome = false,
  });
  final String title;
  final bool actions, isHome;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GestureDetector(
            onTap: () {
              isHome == true
                  ? Get.offAllNamed(AppRoutes.navigationTabScreen)
                  : Get.back();
            },
            child: Container(
              height: 36,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFFFFF)),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: CustomSvg(
                  ImagePaths.back,
                ),
              ),
            )),
      ),
      centerTitle: true,
      title: Text(
        title,
        // style: Theme.of(context)
        //     .textTheme
        //     .titleLarge!
        //     .copyWith(color: Colors.white, fontSize: 18),
      ),
      actions: [
        actions == true
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffFFFFFF)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CustomSvg(
                          ImagePaths.filter,
                        ),
                      ),
                    )),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
