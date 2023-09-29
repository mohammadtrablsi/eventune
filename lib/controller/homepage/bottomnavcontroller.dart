import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/class/statusrequest.dart';
import 'package:Eventune/core/constant/constData.dart';
import 'package:Eventune/core/functions/alert.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';

import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/loginData.dart';
import '../../view/screen/homepage/addStoreOrVenueScreen.dart';
import '../../view/screen/homepage/myEvents.dart';
import '../../view/screen/homepage/homPage.dart';
import '../../view/screen/myOrder/myOrderScreen.dart';
import '../../view/screen/myTicket/registeredEvents.dart';

class Bottomnavcontroller extends GetxController {
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool lang = false;
  bool isPressed = true;
  bool? switchValue = false;
  bool isOwner = false;
  TextEditingController password = TextEditingController();

//for lang
  onchangeswitchlanguage(String language) {
    if (language == "english") {
      controllerlang.changeLang("en");
    }
    if (language == "arabic") {
      controllerlang.changeLang("ar");
    }
    update();
  }

  onchangeswitchmode(bool value) {
    update();
    switchValue = value;
    controllerlang.changetheme(switchValue);
    update();
  }

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  int currentpage = 0;
  List<Widget> Listpage = [];

  to_apear_two_buttons() {
    isPressed = !isPressed;
    update();
  }

  changepage(int i) {
    currentpage = i;
    update();
  }

  @override
  void onInit() {
    scaffoldkey = GlobalKey<ScaffoldState>();
    isOwner =
        myServices.sharedPreferences.getInt('isOwner') == 0 ? false : true;
    switchValue = myServices.sharedPreferences.getBool('theme') ?? false;
    Listpage = [
      HomePage(
        scaffoldKey: scaffoldkey,
      ),
      const MyEvents(),
      HomePage(scaffoldKey: scaffoldkey),
      const MyOrderScreen(),
      const RegisteredEvents(),
    ];
    super.onInit();
  }

  logout() async {
    // myServices.sharedPreferences.clear();
    // Get.offAll(const LoginScreen());

    alert2(
      () async {
        Get.back();
        if (true) {
          statusRequest = StatusRequest.loading;

          update();
          var response = await loginData.logoutData();
          print("=============================== response $response ");
          print(
              "=============================== statusRequest $statusRequest ");
          statusRequest = handlingData(response);
          update();
          if (StatusRequest.success == statusRequest) {
            Map data = {};
            data.addAll(response);
            if (data["status"] == "success") {
              myServices.sharedPreferences.clear();
              AppColor.isDark = false;
              listTimeNotification.clear();
              listNotification.clear();
              Get.offAll(const LoginScreen());
              return Get.snackbar("success", "Logout successfuly",
                  colorText: Colors.white,
                  backgroundColor: AppColor.primaryColor,
                  duration: const Duration(seconds: 3));
            } else {
              statusRequest = StatusRequest.none;
              update();
              return Get.snackbar("fail", "Logout again!",
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
      },
      'sure logout ??',
    );
  }

  ownerAccount() async {
    print(myServices.sharedPreferences.getInt('id'));

    alert(() async {
      Get.back();
      if (true) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await loginData.roleOwnerData(password.text);
        print("=============================== response $response ");
        print("=============================== statusRequest $statusRequest ");
        statusRequest = handlingData(response);
        update();
        if (StatusRequest.success == statusRequest) {
          Map data = {};
          data.addAll(response);
          if (data["status"] == "success") {
            isOwner = true;
            myServices.sharedPreferences.setInt('isOwner', 1);
            Get.offAll(const AddStoreOrVenueScreen());
            return Get.snackbar("success", data['message'],
                colorText: Colors.white,
                backgroundColor: AppColor.primaryColor,
                duration: const Duration(seconds: 3));
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
    }, 'This transaction needs to be paid if you confirm that you may lose your money and in case the operation fails you will be refunded',
        password);
  }
}
