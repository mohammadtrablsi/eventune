import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/restPassword_data.dart';

class ResetPasswordController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController code = TextEditingController();
  MyServices myServices = Get.find();
  TextEditingController? password;
  TextEditingController? rePassword;
  GlobalKey<FormState>? formstate;
  bool isPassword1 = true;
  bool isPassword2 = true;
  var email;

  @override
  void onInit() {
    rePassword = TextEditingController();
    password = TextEditingController();
    formstate = GlobalKey<FormState>();
    email = Get.arguments[0];
    super.onInit();
  }

  void revPassword1() {
    isPassword1 = !isPassword1;
    update();
  }

  void revPassword2() {
    isPassword2 = !isPassword2;
    update();
  }

  checkPassword() {
    if (password!.text.toString() != rePassword!.text.toString()) {
      return Get.defaultDialog(
          middleText: "Password and Confrim Password Not Equal");
    } else {
      replay();
    }
  }

  save() {
    if (formstate!.currentState!.validate()) {
      checkPassword();
      print('validate');
    }
  }

  Map dataRelay = {};
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  replay() async {
    // statusRequest = StatusRequest.loading;
    resetPasswordData.emailController = email;
    resetPasswordData.password = password?.text;
    resetPasswordData.password2 = rePassword?.text;
    update();
    var response;
    response = await resetPasswordData.accept();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        Get.offAll(() => const LoginScreen(), ////////////////
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 1));
        Get.snackbar(dataRelay['status'], dataRelay['message'],
            backgroundColor: AppColor.primaryColor, colorText: Colors.white);
        update();
        // Get.back();
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
}
