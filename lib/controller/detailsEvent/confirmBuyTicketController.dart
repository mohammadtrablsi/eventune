import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/functions/alert.dart';
import 'package:Eventune/view/screen/eventDetails/lastConfirmBuyTicketScreen.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/eventDetails/attendEventData.dart';
import '../../linkapi.dart';

class ConfirmBuyTicketController extends GetxController {
  Map mapData = {};
  GlobalKey<FormState>? formstate;
  TextEditingController password = TextEditingController();
  int? eventId;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AttendEventData attendEventData = AttendEventData(Get.find());
  @override
  void onInit() {
    mapData = Get.arguments;
    eventId = mapData['id'];
    print(eventId);
    // TODO: implement onInit
    super.onInit();
  }

  buyTicket()  {
    alert(() async {
      if (true) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await attendEventData.attendEventData(
            AppLink.token, eventId, password.text);
        print("=============================== response $response ");
        print("=============================== statusRequest $statusRequest ");
        statusRequest = handlingData(response);
        update();
        if (StatusRequest.success == statusRequest) {
          Map data = {};
          data.addAll(response);
          if (data["status"] == "success") {
            print('success.....................');

            Get.offAll(() => const LastConfirmBuyTicket(),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 2));

            return Get.snackbar("success", "${data['message']}",
                colorText: Colors.white,
                backgroundColor: AppColor.primaryColor,
                duration: const Duration(seconds: 5));
          } else {
            return Get.snackbar("fail", "${data['message']}",
                colorText: Colors.white,
                backgroundColor: Colors.red.withOpacity(0.7),
                duration: const Duration(seconds: 3));
          }
        } else if (statusRequest == StatusRequest.offlinefailure) {
          return Get.snackbar(
              "warning", "you are not online please check on it");
        } else if (statusRequest == StatusRequest.serverfailure) {
          return Get.snackbar("warning", "please again later",
              backgroundColor: Colors.red.withOpacity(0.7),
              colorText: Colors.white);
        }
      }
    }, '', password);
  }

  backToPrevious() {
    Get.back();
  }
}
