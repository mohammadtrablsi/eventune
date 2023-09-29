import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/forgetPassword_data.dart';
import '../../data/datasource/remote/auth/verifyCode_data.dart';
import '../../linkapi.dart';
import '../../view/screen/auth/resetPasswordScreen.dart';

class VerifyCodeController extends GetxController {
  var token=AppLink.token;
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController code = TextEditingController();
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  String? email;
  GlobalKey<FormState>? formstate;
  @override
  void onInit() {
    code = TextEditingController();
    formstate = GlobalKey<FormState>();
    email = Get.arguments[0];
    super.onInit();
  }

  verify() {
    if (code.text.length == 5) {
      print(code.text);
     replay();
    } else {
      return Get.defaultDialog(
          middleText:
          "Plaese Enter the 5 Diget Code Send To\n${email.toString()}");
    }
    //Get.offAllNamed(AppRoute.signup);
  }
  Map dataRelay={};
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  replay() async {
    // statusRequest = StatusRequest.loading;
    verifyCodeData.code = code.text;
    verifyCodeData.emailController=email;
    update();
    var response;
    response = await verifyCodeData.accept();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["data"]["verified"] == 1) {
        Get.offAll(() => const ResetPasswordScreen(),
            curve: Curves.fastLinearToSlowEaseIn,
            arguments: [email],
            duration: const Duration(seconds: 1));
        Get.snackbar('Suceess','your email is verified',backgroundColor: AppColor.primaryColor, colorText: Colors.white );
        update();
        // Get.back();
      } else {
        Get.snackbar('fail','your email is not verified' );
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
//resend verify code



  Map datadata={};
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  resendVerify() async {
    // statusRequest = StatusRequest.loading;
    forgetPasswordData.emailController = email;
    update();
    var response;
    response = await forgetPasswordData.accept(token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      datadata.addAll(response);
      if (datadata["status"] == "success") {
        Get.snackbar(datadata['status'],datadata['message'] );
        update();
        // Get.back();
      } else {
        Get.snackbar('fail',datadata['message'] );
      }
    } else if (statusRequest == StatusRequest.failure) {
      update();
      return Get.snackbar("warning", "faild");
    }else if (statusRequest == StatusRequest.offlinefailure) {
      update();
      return Get.snackbar("warning", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      update();
      return Get.snackbar("warning", "404 server faliure");
    }
    update();

  }
}
