import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/class/statusrequest.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/linkapi.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/signupData.dart';
import '../../data/datasource/remote/eventDetails/eventDetailsWithoutAuthrizeData.dart';
import '../../view/screen/homepage/bottomnav.dart';
import '../deepLinkController.dart';
import '../pusher/pusherController.dart';

class SignupController extends GetxController {
  TextEditingController? email;
  TextEditingController? username;
  TextEditingController? password;
  GlobalKey<FormState>? formstate;
  bool isPassword = true;
  Map data = {};
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  EventDetailsWithoutAuthrizeData eventDetailsWithoutAuthrizeData =
      EventDetailsWithoutAuthrizeData(Get.find());
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  goToLogin() {
    // Get.offAllNamed(AppRoute.login);
    Get.offAll(() => const LoginScreen(),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 1));
  }

  void revPassword() {
    isPassword = !isPassword;
    update();
  }

  signup() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.signupData(
        username!.text,
        email!.text,
        password!.text,
      );
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          AppLink.token = data["token"];
          myServices.sharedPreferences.setString("token", data["token"]);
          myServices.sharedPreferences.setInt("isOwner", 0);
          myServices.sharedPreferences.setString("name", data['user']["name"]);
          myServices.sharedPreferences.setInt("id", data['user']["id"]);
          myServices.sharedPreferences
              .setString("email", data['user']["email"]);
          myServices.sharedPreferences.setInt("auth", 2);
          if (myServices.sharedPreferences.getBool('invite') == true) {
            acceptEvent();
            myServices.sharedPreferences.remove('invite');
          }
          PusherController controller = Get.put(PusherController());
          controller.onInit();
          //go to homepage
          Get.offAll(const bottomnav());
          return Get.snackbar("success",
              "Welcolme ${data['user']['name']} \nBy : ${data['user']['email']}",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 3));
        } else {
          return Get.snackbar("fail", "The email or password is falut ",
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning", "The email has already been taken",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    }
  }

  acceptEvent() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await eventDetailsWithoutAuthrizeData.acceptEventData(
        AppLink.token,
        DeepLinkController.type,
        DeepLinkController.idEvent.toString(),
      );
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          return Get.snackbar("success", "",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 3));
        } else {
          return Get.snackbar("fail", "",
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning", "",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    }
  }
}
