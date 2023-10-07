import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/bottom_sheet/Collection_new.dart';
import 'package:meter_reading/Module/bottom_sheet/collection_new.dart';
import 'package:meter_reading/Module/bottom_sheet/read_new.dart';
import 'package:meter_reading/core/helper/animate_do.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_button.dart';

class WidgetBottomSheet extends StatelessWidget {
  const WidgetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceH10(),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SpaceW12(),
              const Text("اختر نوع العملية"),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close))
            ],
          )),
          const SpaceH16(),
          CustomPrimaryButton(
            width: 330,
            text: 'اضافة قراءة',
            onPress: () {
              Get.back();
              // showModalBottomSheet(
              //     isScrollControlled: true,
              //     context: context,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(12.0),
              //       ),
              //     ),
              //     builder: (context) => FadeInUp(
              //         duration: const Duration(milliseconds: 400),
              //         child: Padding(
              //             padding: EdgeInsets.only(
              //                 bottom: MediaQuery.of(context).viewInsets.bottom),
              //             child: const ReadNewBottomSheet())));
            },
          ),
          const SpaceH10(),
          // CustomPrimaryButton(
          //   width: 330,
          //   text: "تحصيل جديد",
          //   onPress: () {
          //     Get.back();
          //     showModalBottomSheet(
          //         isScrollControlled: true,
          //         context: context,
          //         shape: const RoundedRectangleBorder(
          //           borderRadius: BorderRadius.vertical(
          //             top: Radius.circular(12.0),
          //           ),
          //         ),
          //         builder: (context) => FadeInUp(
          //             duration: const Duration(milliseconds: 400),
          //             child: Padding(
          //                 padding: EdgeInsets.only(
          //                     bottom: MediaQuery.of(context).viewInsets.bottom),
          //                 child: const AddCollectionBottomSheet())));
          //   },
          // )
        ],
      ),
    );
  }
}
