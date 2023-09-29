import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/data/datasource/remote/store/addImageStoreOrEventData.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imgaeasset.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../linkapi.dart';
import '../../view/widget/store/detailsVenueOrStoreScreen.dart';

class StoresProfileController extends GetxController {
  List images = [AppImageAsset.logo, AppImageAsset.logo, AppImageAsset.logo];
  int i = 0;
  Map data = {};
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddImageStoreOrEventData addImageStoreOrEventData =
      AddImageStoreOrEventData(Get.find());
  List<File?> files = [];

  buttonforimages(String type) {
    if (type == "right") {
      if (i == images.length - 1) {
        i = i;
      } else {
        i += 1;
      }
      update();
    } else {
      if (i == 0) {
        i = i;
      } else {
        i -= 1;
      }
      update();
    }
  }

  late List times;
  List sat = [];
  List sun = [];
  List mon = [];
  List tue = [];
  List wen = [];
  List thr = [];
  List fri = [];
  foor() {
    for (int i = 0; i < times[0].length; i++) {
      for (int j = 0; j < times[0][i].length; j++) {
        if (times[0][i][j]['day'] == 0) {
          sat.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 1) {
          sun.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 2) {
          mon.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 3) {
          tue.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 4) {
          wen.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 5) {
          thr.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 6) {
          fri.add(times[0][i][j]);
        }
      }
    }
  }

  // var title;
  var latitude;
  var description;
  var name;
  var phones;
  var id;
  late List photos;
  late List products;

  @override
  void onInit() {
    name = Get.arguments[0]['name'];
    latitude = Get.arguments[0]['latitude'];
    description = Get.arguments[0]['description'];
    phones = Get.arguments[0]['phones'];
    id = Get.arguments[0]['id'];
    photos = Get.arguments[0]['photos'];
    times = Get.arguments[0]['times'];
    products = Get.arguments[0]['products'];
    data = Get.arguments[0]['data'][0];
    print(data);
    // print ("$name $latitude $description $id 123 kfjkfkfkfkkfkfk");
    foor();
    // id = Get.arguments[0]['id'];
    // titles.text = title;
    // bodys.text = body;
    //print(' $body ');
    super.onInit();
  }

  addImageStoreData() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addImageStoreOrEventData.addImageStoreOrEventData(
          AppLink.token, files, 1, false);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          print('success.....................');
          myServices.sharedPreferences.setInt('store', 2);
          myServices.sharedPreferences.setInt('storeId', 1);
          Get.offAll(
            const DetailsVenueOrStoreScreen(),
          );
          return Get.snackbar(
              "success", "Please wait for approval by the admin",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 5));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning", "please again later",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    }
  }
}
