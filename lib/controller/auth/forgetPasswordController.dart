import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/forgetPassword_data.dart';
import '../../linkapi.dart';
import '../../view/screen/auth/verifyCodeScreen.dart';

class ForgetPasswordController extends GetxController {
  var token = AppLink.token;
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController emailController = TextEditingController();
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  GlobalKey<FormState>? formstate;
  @override
  void onInit() {
    emailController = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  send() {
    if (formstate!.currentState!.validate()) {
      print('validate');
      replay();
    }
  }

  Map dataRelay = {};
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  replay() async {
    // statusRequest = StatusRequest.loading;
    forgetPasswordData.emailController = emailController.text;
    update();
    var response;
    response = await forgetPasswordData.accept("$token");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        Get.offAll(() => const VerifyCodeScreen(),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 1),
            arguments: [emailController.text]);
        Get.snackbar(dataRelay['status'], dataRelay['message'],
            backgroundColor: AppColor.primaryColor, colorText: Colors.white);
        update();
        // Get.back();
      } else {
        Get.snackbar('fail', dataRelay['message']);
      }
    } else if (statusRequest == StatusRequest.failure) {
      update();
      return Get.snackbar("warning", "faild");
    } else if (statusRequest == StatusRequest.offlinefailure) {
      update();
      return Get.snackbar("warning", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      update();
      return Get.snackbar("warning", "404 server faliure");
    }
    update();
  }
}
