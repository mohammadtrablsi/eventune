import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';

import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';

import '../../data/datasource/remote/homepage/feedBack_data.dart';
import '../../linkapi.dart';

class FeedBackController extends GetxController {
  MyServices myServices = Get.find();

  var token = AppLink.token;
  late TextEditingController feedBackTextController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  Map dataRelay = {};
  FeedBackData feedBackData = FeedBackData(Get.find());

  makeFeedBack() async {
    feedBackData.content = feedBackTextController.text;
    update();
    var response;
    response = await feedBackData.send(token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        Get.back();
        Get.snackbar(dataRelay['status'], dataRelay['message']);
        update();
      } else {
        Get.snackbar(dataRelay['status'], dataRelay['message']);
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      update();
      return Get.snackbar("warning", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      update();
      return Get.snackbar("warning", "404 server faliure");
    }
    update();
  }

  void onInit() {
    feedBackTextController = TextEditingController();
    super.onInit();
  }
}
