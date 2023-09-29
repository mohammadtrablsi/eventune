import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/store/addStoreData.dart';
import '../../view/widget/store/detailsVenueOrStoreScreen.dart';

class CreateStoreController extends GetxController {
  TextEditingController? venueName;
  TextEditingController? numberPhone;
  TextEditingController? description;
  TextEditingController? priceDelivery;
  bool isDelivery = false;

  var isSelected;
  double longitude = 0.0, latitude = 0.0;
  File? file;
  List<File?> files = [];
  Map data = {};
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddStoreData addStoreData = AddStoreData(Get.find());
  @override
  void onInit() {
    venueName = TextEditingController();
    priceDelivery = TextEditingController();
    numberPhone = TextEditingController();
    description = TextEditingController();
    formstate = GlobalKey<FormState>();

    super.onInit();
  }

  void pickLocation(lon, lat) {
    longitude = lon;
    latitude = lat;
  }

  List<XFile?> images = [];
  pickMultiImage() async {
    images = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        files.add(File(images[i]!.path));
      }
      print('============ $files');
      update();
      Get.back();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  selectifServeceDeliveryOrNot(val) {
    isSelected = val;
    if (isSelected != 'Yes,we have Serves Delivery') {
      isDelivery = false;
    } else {
      isDelivery = true;
      priceDelivery?.clear();
    }
    update();
  }

  next() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addStoreData.addStoreData(
          AppLink.token,
          venueName!.text,
          description!.text,
          longitude.toString(),
          latitude.toString(),
          numberPhone!.text,
          files,
          isDelivery ? '1' : '0',
          priceDelivery?.text);
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
