import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/bottom_sheet/read_new.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/animate_do.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_button.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetEmpty extends StatelessWidget {
  const WidgetEmpty({
    super.key,
    required this.isRead,
  });

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SpaceH20(),
          const Center(
            child: CustomSvg(
              ImagePaths.empty,
              height: 130,
            ),
          ),
          const SpaceH12(),
          Text("القائمة فارغة !",
              style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith()),
          const SpaceH20(),
          // isRead == true
          //     ? CustomPrimaryButton(
          //         width: 173,
          //         text: 'اضافة قراءة',
          //         onPress: () async {
          //           // await SqlDbHelper.deleteDataBase();
          //           // showModalBottomSheet(
          //           //     isScrollControlled: true,
          //           //     context: Get.context!,
          //           //     shape: const RoundedRectangleBorder(
          //           //       borderRadius: BorderRadius.vertical(
          //           //         top: Radius.circular(12.0),
          //           //       ),
          //           //     ),
          //           //     builder: (context) => FadeInUp(
          //           //         duration: const Duration(milliseconds: 400),
          //           //         child: Padding(
          //           //             padding: EdgeInsets.only(
          //           //                 bottom: MediaQuery.of(context)
          //           //                     .viewInsets
          //           //                     .bottom),
          //           //             child: const ReadNewBottomSheet())));
          //         },
          //       )
          //     : const SizedBox.shrink()
        ],
      ),
    );
  }
}
