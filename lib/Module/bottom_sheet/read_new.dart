import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/bottom_sheet/bottom_sheet_controller.dart';
import 'package:meter_reading/Module/home/controller/home_controller.dart';
import 'package:meter_reading/Module/search/controller/search_controller.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/image_helper.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/core/utils/toast.dart';
import 'package:meter_reading/model/user_model.dart';
import 'package:meter_reading/services/home_service.dart';
import 'package:meter_reading/widgets/custom_button.dart';
import 'package:meter_reading/widgets/custom_input.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class ReadNewBottomSheet extends StatefulWidget {
  const ReadNewBottomSheet({super.key, required this.usersModel});
  final UsersModel usersModel;
  @override
  State<ReadNewBottomSheet> createState() => _ReadNewBottomSheetState();
}

class _ReadNewBottomSheetState extends State<ReadNewBottomSheet> {
  SearchScreenController searchcontroller = Get.find();
  BottomSheetController? controller;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = Get.put(BottomSheetController());
    controller!.nameController.value.text =
        widget.usersModel.customerName ?? "";
    controller!.accountNo.value.text = widget.usersModel.accountId ?? "";
    controller!.readTextController.value.text = "";
    controller!.lastReadController.value.text =
        widget.usersModel.lastRead ?? "";
    controller!.readImage.value = "";
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return SingleChildScrollView(
        child: Obx(() => SizedBox(
            height: controller!.readImage.value == "" ? 400.h : 520.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
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
                          const Text("إضافة جديدة"),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close))
                        ],
                      )),
                      const SpaceH10(),

                      CustomInput(
                        hint: "اسم المشترك إجباري",
                        textInputType: TextInputType.number,
                        isEnabled: false,
                        controller: controller!.nameController.value,
                      ),
                      // TextFormField(
                      //     keyboardType: TextInputType.text,
                      //     textInputAction: TextInputAction.search,
                      //     style: Theme.of(context).textTheme.bodyMedium!,
                      //     controller: controller!.nameController.value,
                      //     enabled: false,
                      //     validator: MultiValidator([
                      //       RequiredValidator(errorText: "اسم المشترك إجباري".tr),
                      //     ]),
                      //     // onChanged: (value) {
                      //     //   if (value == "") {
                      //     //     controller!.nameController.value.text = "";
                      //     //     searchcontroller.searchSaggestModel.value = [];
                      //     //   } else {
                      //     //     searchcontroller.setSaggetstSearch(
                      //     //       search: controller!.nameController.value.text,
                      //     //     );
                      //     //   }
                      //     // },
                      //     decoration: InputDecoration(
                      //         hintText: 'اسم المشترك'.tr,
                      //         filled: true,
                      //         fillColor: Colors.white,
                      //         suffixIcon: Obx(() =>
                      //             controller!.nameController.value.text == ""
                      //                 ? const SizedBox.shrink()
                      //                 : InkWell(
                      //                     onTap: () {
                      //                       controller!
                      //                           .nameController.value.text = "";
                      //                       searchcontroller
                      //                           .searchSaggestModel.value = [];
                      //                     },
                      //                     child: const Icon(
                      //                       Icons.close,
                      //                       color: Colors.grey,
                      //                       size: 22,
                      //                     ),
                      //                   )),
                      //         hintStyle: Theme.of(context).textTheme.bodyMedium!,
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(8),
                      //             borderSide:
                      //                 BorderSide(color: Colors.grey[300]!)),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(8),
                      //             borderSide:
                      //                 BorderSide(color: Colors.grey[300]!)),
                      //         contentPadding: const EdgeInsets.all(8),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //           borderSide: const BorderSide(color: Colors.green),
                      //         ))),

                      const SpaceH10(),
                      CustomInput(
                        hint: "رقم الاشتراك",
                        textInputType: TextInputType.number,
                        isEnabled: false,
                        controller: controller!.accountNo.value,
                      ),
                      const SpaceH10(),
                      SizedBox(
                        // height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(() => CustomInput(
                                    hint: "اخر قراءة",
                                    textInputType: TextInputType.number,
                                    controller:
                                        controller!.lastReadController.value,
                                    isEnabled: true,
                                  )),
                            ),
                            const SpaceW12(),
                            Expanded(
                              child: CustomInput(
                                hint: "قراءة العداد",
                                textInputType: TextInputType.number,
                                autoFocus: true,
                                controller:
                                    controller!.readTextController.value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SpaceH10(),
                      // Obx(() => searchcontroller.searchSaggestModel.isNotEmpty
                      //     ? ListView.builder(
                      //         physics: const ClampingScrollPhysics(),
                      //         padding: EdgeInsets.zero,
                      //         shrinkWrap: true,
                      //         primary: false,
                      //         itemCount: searchcontroller.searchSaggestModel
                      //             .take(10)
                      //             .length,
                      //         itemBuilder: (context, index) {
                      //           final suggestion =
                      //               searchcontroller.searchSaggestModel[index];

                      //           if (suggestion.customerName!
                      //               .toLowerCase()
                      //               .contains(searchcontroller.selectedSuggestion
                      //                   .toLowerCase())) {
                      //             return Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 ListTile(
                      //                     title: Text(suggestion.customerName!,
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .titleMedium!),
                      //                     minLeadingWidth: 15,
                      //                     leading: const Padding(
                      //                       padding: EdgeInsets.only(top: 6),
                      //                       child: CustomSvg(ImagePaths.search,
                      //                           height: 18),
                      //                     ),
                      //                     onTap: () async {
                      //                       // controller!.uersModel.value =
                      //                       //     suggestion;
                      //                       controller!.nameController.value
                      //                           .text = suggestion.customerName!;

                      //                       controller!.accountNo.value.text =
                      //                           suggestion.accountId.toString();
                      //                       controller!.lastReadController.value
                      //                               .text =
                      //                           suggestion.lastRead.toString();
                      //                       searchcontroller
                      //                           .searchSaggestModel.value = [];
                      //                     }),
                      //                 const MySeparator()
                      //               ],
                      //             );
                      //           }
                      //           return null;
                      //         },
                      //       )
                      //     :

                      Column(
                        children: [
                          Obx(() => controller!.readImage.value == ""
                              ? GestureDetector(
                                  onTap: () async {
                                    FocusManager.instance.primaryFocus!
                                        .unfocus();
                                    controller!.readImage.value =
                                        await ImageHelper.helper.pickImage() ??
                                            "";
                                  },
                                  child: DottedBorder(
                                    color: LightThemeColors.primaryColor,
                                    strokeWidth: 1,
                                    dashPattern: const [7, 7],
                                    radius: const Radius.circular(12),
                                    borderType: BorderType.RRect,
                                    child: SizedBox(
                                      height: 60,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
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
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                      height: 200,
                                      width: Get.width,
                                      child: Image.file(
                                        File(controller!.readImage.value),
                                        fit: BoxFit.fill,
                                      )),
                                )),
                          const SpaceH20(),
                          CustomPrimaryButton(
                              width: 330,
                              text: "اضافة",
                              onPress: () async {
                                if (controller!.readTextController.value.text ==
                                    "") {
                                  showToast("تحذير", "يجب اضافة قراءة العداد",
                                      ToastType.WARNING);
                                }
                                if (controller!.readImage.value == "") {
                                  showToast("تحذير", "يجب اضافة صورة العداد",
                                      ToastType.WARNING);
                                } else {
                                  await HomeService.inserHistoryRead(
                                      widget.usersModel,
                                      controller!.readTextController.value.text,
                                      controller!.readImage.value);
                                  await HomeService.removeUserData(
                                      widget.usersModel.accountId!);
                                  homeController.userList.removeWhere(
                                      (element) =>
                                          element.accountId ==
                                          widget.usersModel.accountId!);
                                  homeController.userAreasList.removeWhere(
                                      (element) =>
                                          element.accountId ==
                                          widget.usersModel.accountId!);
                                  homeController.update(['read']);
                                  Get.back();
                                  showToast("تم", "تمت القراءة بنجاح",
                                      ToastType.SUCCESS);
                                }
                                // }
                              })
                        ],
                      ),
                    ]),
              ),
            ))));
  }
}
