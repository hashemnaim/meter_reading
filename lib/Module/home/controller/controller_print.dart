import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';
import 'dart:async';

class PrintController extends GetxController {
  Future<Uint8List> getImageFromAsset(String iconPath) async {
    return await readFileBytes(iconPath);
  }

  Future<Uint8List> readFileBytes(String path) async {
    ByteData fileData = await rootBundle.load(path);
    Uint8List fileUnit8List = fileData.buffer
        .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    return fileUnit8List;
  }

  @override
  void onInit() async {
    await SunmiPrinter.bindingPrinter();
    super.onInit();
  }

  // Future printOrder(Data orderModel, int timeSelect, int id) async {
  //   if (appController.order.value == false) {
  //     // appController.timeDelveri.value =
  //     //     appController.minutes[orderController.currentMinuteIndex];
  //     appController.stopAlert();

  //     if (orderController.withPrint.value == true) {
  //       if (SHelper.sHelper.getPrinter() == "All") {
  //         var value = await ServerOrder.instance.updateOrder(
  //             orderModel.preOrder, orderModel.id, 1, timeSelect.toString());

  //         if (value['header_1'] != null) {
  //           orderModel.headerData = <HeaderData>[];
  //           value['header_1'].forEach((v) {
  //             orderModel.headerData?.add(HeaderData.fromJson(v));
  //           });
  //         }

  //         printFatora(orderModel, timeSelect, id);

  //         Get.back();
  //       } else {
  //         if (orderModel.printList![await SHelper.sHelper.getPrinterId()]
  //                 .dataPrintList!.length ==
  //             0) {
  //           Get.defaultDialog(
  //               title: "Alert",
  //               middleText:
  //                   "There are no products to print, you have to go to change the printer",
  //               onConfirm: () {
  //                 Get.to(() => PrinterSetting());
  //               },
  //               textConfirm: "Go To Setting".tr,
  //               buttonColor: AppColors.primary,
  //               cancelTextColor: Colors.black,
  //               confirmTextColor: Colors.black);
  //         } else {
  //           var value = await ServerOrder.instance.updateOrder(
  //               orderModel.preOrder, orderModel.id, 1, timeSelect.toString());
  //           if (value['header_1'] != null) {
  //             orderModel.headerData = <HeaderData>[];
  //             value['header_1'].forEach((v) {
  //               orderModel.headerData?.add(HeaderData.fromJson(v));
  //             });
  //           }
  //           printTextCustom(orderModel, await SHelper.sHelper.getPrinterId());

  //           orderController.currentMinuteIndex = 0;

  //           appController.order.value = false;
  //           orderController.begin.value = true;

  //           Get.back();
  //         }
  //       }
  //     } else {
  //       await ServerOrder.instance.updateOrder(
  //           orderModel.preOrder, orderModel.id, 1, timeSelect.toString());
  //       orderController.currentMinuteIndex = 0;

  //       appController.order.value = false;
  //       orderController.begin.value = true;

  //       Get.back();
  //     }
  //   }
  // }

  // Future printFatora(Data orderModel, int timeSelect, int id) async {
  //   await SunmiPrinter.initPrinter();

  //   await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);

  //   await SunmiPrinter.startTransactionPrint(true);
  //   // ByteData imageData = await NetworkAssetBundle(
  //   //         Uri.parse(orderController.newOrders.value.logo.toString()))
  //   //     .load("");
  //   // Uint8List byte = imageData.buffer.asUint8List();

  //   // await PrintHeader(orderModel.headerData!, byte);
  //   // await PrintProduct(orderModel.printList![id], byte);

  //   await SunmiPrinter.lineWrap(1);
  //   await SunmiPrinter.cut();

  //   await SunmiPrinter.exitTransactionPrint(true);
  // }

//   Future printTextCustom("Data orderModel", int id) async {
//     await SunmiPrinter.initPrinter();
//     await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);

//     await SunmiPrinter.startTransactionPrint(true);
//     ByteData imageData = await NetworkAssetBundle(
//             Uri.parse(orderController.newOrders.value.logo.toString()))
//         .load("");
//     Uint8List byte = imageData.buffer.asUint8List();

//     await PrintProduct(orderModel.printList![id], byte);
//     await PrintHeader(orderModel.headerData!, byte);

//     await SunmiPrinter.resetBold();

//     await SunmiPrinter.exitTransactionPrint(true);
//   }
// }

// Future PrintProduct(PrintList orderModel, byte) async {
//   await SunmiPrinter.line();
//   for (int i = 0; i < orderModel.dataPrintList!.length; i++) {
//     if (orderModel.dataPrintList![i].type == "text") {
//       await SunmiPrinter.printText(
//         "${orderModel.dataPrintList![i].val}",
//         style: SunmiStyle(
//           align: SunmiPrintAlign.LEFT,
//           bold: orderModel.dataPrintList![i].bold == 0 ? false : true,
//           fontSize:
//               SunmiFontSize.values[orderModel.dataPrintList![i].fontSize!],
//         ),
//       );
//     } else if (orderModel.dataPrintList![i].type == "line") {
//       await SunmiPrinter.line();
//     } else if (orderModel.dataPrintList![i].type == "qrcod") {
//       await SunmiPrinter.printQRCode(orderModel.dataPrintList![i].val!);
//     } else if (orderModel.dataPrintList![i].type == "barcode") {
//       await SunmiPrinter.printBarCode(orderModel.dataPrintList![i].val!,
//           barcodeType: SunmiBarcodeType.CODE128,
//           textPosition: SunmiBarcodeTextPos.TEXT_UNDER,
//           height: 20);
//     } else if (orderModel.dataPrintList![i].type == "logo") {
//       await SunmiPrinter.printImage(
//         byte,
//       );
//     } else if (orderModel.dataPrintList![i].type == "line_wrap") {
//       await SunmiPrinter.lineWrap(int.parse(orderModel.dataPrintList![i].val!));
//     }
//   }
// }

  Future printHeader(List<String> headerData) async {
    // for (int i = 0; i < headerData.length; i++) {
    // if (headerData[i].type == "text") {
    await SunmiPrinter.printText(
      "رقم الاشتراك #${headerData[1]}",
      style: SunmiStyle(
        align: SunmiPrintAlign.CENTER,
        bold: true,
        fontSize: SunmiFontSize.LG,
      ),
    );
    await SunmiPrinter.lineWrap(1);

    await SunmiPrinter.printText(
      "اسم المشترك: ${headerData[2]}",
      style: SunmiStyle(
        align: SunmiPrintAlign.RIGHT,
        bold: true,
        fontSize: SunmiFontSize.LG,
      ),
    );
    await SunmiPrinter.printText(
      "المبلغ :${headerData[0]} شيكل",
      style: SunmiStyle(
        align: SunmiPrintAlign.RIGHT,
        bold: true,
        fontSize: SunmiFontSize.LG,
      ),
    );

    await SunmiPrinter.line();
    await SunmiPrinter.lineWrap(3);
    // } else if (headerData[i].type == "line") {
    //   await SunmiPrinter.line();
    // } else if (headerData[i].type == "qrcode") {
    //   await SunmiPrinter.printQRCode(headerData[i].val!);
    // } else if (headerData[i].type == "barcode") {
    //   await SunmiPrinter.printBarCode(headerData[i].val!,
    //       barcodeType: SunmiBarcodeType.CODE128,
    //       textPosition: SunmiBarcodeTextPos.TEXT_UNDER,
    //       height: 20);
    // } else if (headerData[i].type == "logo") {
    //   await SunmiPrinter.printImage(
    //     byte,
    //   );
    // } else if (headerData[i].type == "image") {
    //   ByteData imageData =
    //       await NetworkAssetBundle(Uri.parse(headerData[i].val!)).load("");
    //   Uint8List byte = imageData.buffer.asUint8List();
    //   await SunmiPrinter.printImage(
    //     byte,
    //   );
    // } else if (headerData[i].type == "linewrap") {
    //   await SunmiPrinter.lineWrap(
    //       int.parse(headerData[i].val == "" ? "1" : headerData[i].val!));
    // }
  }
}
