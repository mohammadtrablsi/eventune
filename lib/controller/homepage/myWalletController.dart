import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/loginData.dart';

class MyWalletController extends GetxController {
  Map myWalletMapData = {};
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isBack = false;
  @override
  onInit() {
    myWalletInfo();
    super.onInit();
  }

  myWalletInfo() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.myWalletData();
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map data = {};
        data.addAll(response);
        if (data["status"] == "success") {
          myWalletMapData = data['data'];
          print(myWalletMapData);
        } else {
          statusRequest = StatusRequest.none;
          update();

          return Get.snackbar("fail", data['message'],
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning", "Error..");
      }
    }
  }

  switchCard() {
    isBack = !isBack;
    update();
  }
}
