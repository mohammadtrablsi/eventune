import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import 'package:Eventune/view/screen/auth/signupScreen.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:sizer/sizer.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/eventDetails/eventDetailsWithoutAuthrizeData.dart';
import '../../linkapi.dart';
import '../../view/screen/auth/splash_screen.dart';
import '../deepLinkController.dart';

class EventDetailsScreenForInviteController extends GetxController {
  late GlobalKey previewContainer;
  bool isOpenChat = false;
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  EventDetailsWithoutAuthrizeData eventDetailsWithoutAuthrizeData =
      EventDetailsWithoutAuthrizeData(Get.find());
  Map mapData = {};
  @override
  void onInit() {
    previewContainer = GlobalKey();
    getData();
    print(mapData);
    super.onInit();
  }

  shareScreen() async {}

  showOrHideChat() {
    isOpenChat = !isOpenChat;
    update();
  }

  backToPrevious() {
    Get.offAll(() => const bottomnav(),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 1));
  }

  acceptOrReject(type, context) async {
    if (type == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 13.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Do you account in EvenTuneApp : ",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (myServices.sharedPreferences.getInt('id') !=
                                null) {
                              acceptEvent();
                            } else {
                              myServices.sharedPreferences
                                  .setBool('invite', true);

                              Get.to(
                                () => const LoginScreen(),
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(seconds: 2),
                              );
                            }
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                fontSize: 14.sp, color: AppColor.primaryColor),
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      TextButton(
                          onPressed: () {
                            myServices.sharedPreferences
                                .setBool('invite', true);
                            Get.to(
                              () => const SignupScreen(),
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 2),
                            );
                          },
                          child: Text(
                            "No",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.red),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      Get.to(
        () => const SplashScreen(),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 2),
      );
    }
  }

  getData() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await eventDetailsWithoutAuthrizeData.eventDetailsWithoutAuthrizeData(
              DeepLinkController.type, DeepLinkController.idEvent.toString());
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map data = {};
        data.addAll(response);
        if (data["status"] == "success") {
          mapData = data['data'];
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              backgroundColor: AppColor.primaryColor,
              colorText: Colors.white,
              duration: const Duration(seconds: 5));
          //next.....
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning",
            "Please make sure to fill out all fields or try again later",
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
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          Get.offAll(
            () => const bottomnav(),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 2),
          );
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
