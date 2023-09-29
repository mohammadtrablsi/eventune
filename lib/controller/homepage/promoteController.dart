import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/functions/alert.dart';

import 'package:Eventune/data/datasource/remote/homepage/promoteData.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../linkapi.dart';

class PromoteController extends GetxController {
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController text1 = TextEditingController();
  TextEditingController password = TextEditingController();

  PromoteData promoteData = PromoteData(Get.find());
  var isSelected;
  int numMethode = 1;
  int? eventId;
  String? typePlace;
  @override
  void onInit() {
    eventId = Get.arguments['eventId'];
    typePlace = Get.arguments['typePlace'];
    // TODO: implement onInit
    super.onInit();
  }

  select(val) {
    isSelected = val;
    if (isSelected == 'Show as suggetion') {
      numMethode = 1;
    } else {
      numMethode = 2;
    }
    update();
  }

  next() async {
    alert(() async {
      if (true) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await promoteData.promoteData(
            AppLink.token,
            password.text,
            eventId.toString(),
            typePlace,
            text1.text.toString(),
            numMethode);
        print("=============================== response $response ");
        print("=============================== statusRequest $statusRequest ");
        statusRequest = handlingData(response);
        update();
        if (StatusRequest.success == statusRequest) {
          Map data = {};
          data.addAll(response);
          if (data["status"] == "success") {
            Get.offAll(const bottomnav());
            return Get.snackbar("success",
                "The operation was completed successfully, congratulations",
                backgroundColor: AppColor.primaryColor,
                colorText: Colors.white,
                duration: const Duration(seconds: 5));
          } else {
            return Get.snackbar("warning", data['message'],
                backgroundColor: Colors.red.withOpacity(0.7),
                colorText: Colors.white);
          }
        } else if (statusRequest == StatusRequest.offlinefailure) {
          return Get.snackbar(
              "warning", "you are not online please check on it");
        } else if (statusRequest == StatusRequest.serverfailure) {
          return Get.snackbar("warning",
              "Please make sure to fill out all fields or try again later",
              backgroundColor: Colors.red.withOpacity(0.7),
              colorText: Colors.white);
        }
      }
    }, '', password);
  }
}
