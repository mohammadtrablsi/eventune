import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/venue/addVenueData.dart';
import '../../view/widget/store/detailsVenueOrStoreScreen.dart';

class CreateVenueController extends GetxController {
  TextEditingController? venueName;
  TextEditingController? numberPhone;
  TextEditingController? description;
  double longitude = 0.0, latitude = 0.0;
  List<File?> files = [];
  Map data = {};
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddVenueData addVenueData = AddVenueData(Get.find());
  @override
  void onInit() {
    venueName = TextEditingController();
    numberPhone = TextEditingController();
    description = TextEditingController();
    formstate = GlobalKey<FormState>();

    super.onInit();
  }

  void pickLocation(lon, lat) {
    longitude = lon;
    latitude = lat;
  }

  pickMultiImage() async {
    List<XFile?> images = await ImagePicker().pickMultiImage();
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

  next() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addVenueData.addVenueData(
          AppLink.token,
          venueName!.text,
          description!.text,
          longitude.toString(),
          latitude.toString(),
          numberPhone!.text,
          files);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          print('success.....................');
          myServices.sharedPreferences.setInt('venue', 2);
          myServices.sharedPreferences.setInt('venueId', 1);
          Get.offAll(
            const DetailsVenueOrStoreScreen(),
          );
          return Get.snackbar("success",
              "${data['message']}\nPlease wait for approval by the admin",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 5));
        } else {
          return Get.snackbar("fail", "${data['message']}",
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
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
