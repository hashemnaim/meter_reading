import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/bottom_sheet/bottom_sheet_controller.dart';
import 'package:meter_reading/Module/history/controller/history_controller.dart';
import 'package:meter_reading/Module/home/controller/home_controller.dart';
import 'package:meter_reading/Module/search/controller/search_controller.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/image_helper.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/data/data_base.dart';
import 'package:meter_reading/model/user_model.dart';
import 'package:meter_reading/services/history_service.dart';
import 'package:meter_reading/services/home_service.dart';
import 'package:meter_reading/widgets/custom_button.dart';
import 'package:meter_reading/widgets/custom_input.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class EditReadBottomSheet extends StatefulWidget {
  const EditReadBottomSheet({super.key, required this.usersModel});
  final UsersModel usersModel;

  @override
  State<EditReadBottomSheet> createState() => _ReadNewBottomSheetState();
}

class _ReadNewBottomSheetState extends State<EditReadBottomSheet> {
  SearchScreenController searchcontroller = Get.find();
  SqlDbHelper sqlDbHelper = SqlDbHelper();

  BottomSheetController? controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(BottomSheetController());
    controller!.readImage.value = widget.usersModel.image!;
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    HistoryController historyController = Get.put(HistoryController());

    return SingleChildScrollView(
        child: SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                const Text("تفاصيل القراءة"),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close))
              ],
            )),
            const SpaceH10(),
            CustomInput(
              hint: "رقم الاشتراك",
              textInputType: TextInputType.number,
              isEnabled: false,
              controller: TextEditingController(
                  text: widget.usersModel.accountId.toString()),
            ),
            const SpaceH10(),
            CustomInput(
              hint: "اسم الاشتراك",
              textInputType: TextInputType.number,
              isEnabled: false,
              controller:
                  TextEditingController(text: widget.usersModel.customerName),
            ),
            const SpaceH10(),
            CustomInput(
              hint: "قراءة العداد",
              textInputType: TextInputType.number,
              controller: TextEditingController.fromValue(
                  TextEditingValue(text: widget.usersModel.lastRead!)),
              onChange: (p0) {
                widget.usersModel.lastRead = p0;
              },
            ),
            const SpaceH10(),
            Column(
              children: [
                Obx(() => Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            controller!.clickImage.value = true;
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                                height: 200,
                                width: Get.width,
                                child: Image.file(
                                  File(controller!.readImage.value == ""
                                      ? widget.usersModel.image!
                                      : controller!.readImage.value),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),

                        controller!.clickImage.value == true
                            ? InkWell(
                                onTap: () {
                                  controller!.clickImage.value = false;
                                },
                                child: Container(
                                    height: 200,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black.withOpacity(0.5))),
                              )
                            : const SizedBox.shrink(),

                        controller!.clickImage.value == true
                            ? Positioned(
                                top: 80,
                                left: 80,
                                right: 80,
                                child: GestureDetector(
                                  onTap: () async {
                                    controller!.readImage.value =
                                        await ImageHelper.helper.pickImage() ??
                                            "";
                                    homeController.refresh();
                                    controller!.clickImage.value = false;
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomSvg(ImagePaths.camera),
                                          SpaceW16(),
                                          Text(
                                            "التقاط صورة",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                        // : const SizedBox.shrink(),
                      ],
                    )),
                const SpaceH16(),
                CustomPrimaryButton(
                  width: 330,
                  text: "حفظ التعديلات",
                  onPress: () async {
                    log(widget.usersModel.lastRead!);
                    log(
                      controller!.readImage.value == ""
                          ? widget.usersModel.image!
                          : controller!.readImage.value,
                    );
                    await HistoryService.updateHistoryRead(
                        widget.usersModel.lastRead!,
                        controller!.readImage.value == ""
                            ? widget.usersModel.image!
                            : controller!.readImage.value,
                        widget.usersModel.accountId!);

                    // homeController.getReadDB();

                    historyController.getHistoryReads();
                    // historyController.update(['read']);
                    Get.back();
                  },
                ),
                const SpaceH16(),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: CustomButton(
                    text: "حذف",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                    backgroundColor: Colors.red,
                    onPressed: () async {
                      HistoryService.removeHistoryRead(
                          widget.usersModel.accountId!);
                      historyController.historyReadsist.removeWhere((element) =>
                          element.accountId == widget.usersModel.accountId!);
                      await HomeService.insertUserData(widget.usersModel);
                      homeController.userList.insert(0, widget.usersModel);
                      homeController.getReadDB();

                      homeController.update(['read']);
                      historyController.update(['read']);
                      Get.back();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
