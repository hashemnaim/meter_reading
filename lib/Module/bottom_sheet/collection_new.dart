import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/bottom_sheet/bottom_sheet_controller.dart';
import 'package:meter_reading/Module/history/controller/history_controller.dart';
import 'package:meter_reading/Module/home/controller/controller_print.dart';
import 'package:meter_reading/Module/home/controller/home_controller.dart';
import 'package:meter_reading/Module/search/controller/search_controller.dart';

import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/model/collcetion_user_model.dart';
import 'package:meter_reading/model/user_model.dart';
import 'package:meter_reading/services/home_service.dart';
import 'package:meter_reading/widgets/custom_button.dart';
import 'package:meter_reading/widgets/custom_input.dart';

class AddCollectionBottomSheet extends StatefulWidget {
  const AddCollectionBottomSheet({super.key, required this.usersModel});
  final UsersModel usersModel;

  @override
  State<AddCollectionBottomSheet> createState() => _ReadNewBottomSheetState();
}

class _ReadNewBottomSheetState extends State<AddCollectionBottomSheet> {
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
    controller!.newCollectionTextController.value.text = "";
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    HistoryController historyController = Get.put(HistoryController());
    PrintController printController = Get.put(PrintController());

    return Obx(() => SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: formKey,
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
                        const Text("إضافة جديدة"),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close))
                      ],
                    )),
                    const SpaceH10(),
                    const SpaceH10(),
                    CustomInput(
                      hint: "رقم الاشتراك",
                      textInputType: TextInputType.number,
                      isEnabled: false,
                      controller: controller!.nameController.value,
                    ),
                    // TextFormField(
                    //     keyboardType: TextInputType.text,
                    //     autofocus: true,
                    //     textInputAction: TextInputAction.search,
                    //     style: Theme.of(context).textTheme.bodyMedium!,
                    //     controller: controller!.nameController.value,
                    //     validator: MultiValidator([
                    //       RequiredValidator(errorText: "اسم المشترك إجباري".tr),
                    //     ]),
                    //     onChanged: (value) {
                    //       if (value == "") {
                    //         controller!.nameController.value.text = "";
                    //         searchcontroller.searchSaggestModel.value = [];
                    //       } else {
                    //         searchcontroller.setSaggetstSearch(
                    //           search: controller!.nameController.value.text,
                    //         );
                    //       }
                    //     },
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
                    Obx(() => CustomInput(
                          hint: "تحصيل",
                          textInputType: TextInputType.number,
                          controller:
                              controller!.newCollectionTextController.value,
                          autoFocus: true,
                          formValidator: MultiValidator([
                            RequiredValidator(errorText: "تحصيل إجباري".tr),
                          ]),
                        )),
                    const SpaceH10(),
                    // Obx(() => searchcontroller.searchSaggestModel.isNotEmpty
                    //     ? ListView.builder(
                    //         physics: const ClampingScrollPhysics(),
                    //         padding: EdgeInsets.zero,
                    //         shrinkWrap: true,
                    //         primary: false,
                    //         itemCount:
                    //             searchcontroller.searchSaggestModel.length,
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
                    //                       controller!.nameController.value
                    //                           .text = suggestion.customerName!;
                    //                       // controller!.uersModel.value =
                    //                       //     suggestion;

                    //                       controller!.accountNo.value.text =
                    //                           suggestion.accountId.toString();
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
                        // const SpaceH16(),
                        // CustomPrimaryButton(
                        //   width: 330,
                        //   text: "تحصيل",
                        //   onPress: () async {
                        //     if (formKey.currentState!.validate()) {
                        //       await homeController.insertCollectionUser(
                        //           CollcetionUserModel(
                        //               price: controller!
                        //                   .newCollectionTextController
                        //                   .value
                        //                   .text,
                        //               dateTime: DateTime.now().toString(),
                        //               accountNo: controller!
                        //                   .uersModel.value.accountId,
                        //               usersModel:
                        //                   controller!.uersModel.value));
                        //       homeController.update(['read']);
                        //       Get.back();
                        //     }
                        //   },
                        // ),
                        // const SpaceH16(),
                        CustomPrimaryButton(
                          width: 330,
                          text: "تحصيل مع طباعة",
                          onPress: () async {
                            if (formKey.currentState!.validate()) {
                              await HomeService.insertCollcetionUser(
                                  CollcetionUserModel(
                                      price: controller!
                                          .newCollectionTextController
                                          .value
                                          .text,
                                      dateTime: DateTime.now().toString(),
                                      accountNo: widget.usersModel.accountId,
                                      customerName:
                                          widget.usersModel.customerName));

                              homeController.update(['read']);
                              printController.printHeader([
                                controller!
                                    .newCollectionTextController.value.text,
                                widget.usersModel.accountId!,
                                widget.usersModel.customerName!
                              ]);

                              Get.back();
                              historyController.getCollectionUser();
                              FocusScopeNode currentFocus =
                                  FocusScope.of(Get.context!);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                                homeController.searchTextController.value.text =
                                    "";
                              }

                              setState(() {});
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
