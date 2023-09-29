import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Eventune/view/screen/createEvent/checkScheduleScreen.dart';
import '../../core/class/statusrequest.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/createEvent/customCreateEventData.dart';

class ImagesAndPaidController extends GetxController {
  TextEditingController? priceTicket;
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CustomCreateEventData customCreateEventData =
      CustomCreateEventData(Get.find());
  var isSelected;
  bool selectedTime1 = false, selectedTime2 = false;
  bool isFree = true;
  Map mapData = {};
  List<File?> files = [];
  @override
  void onInit() {
    priceTicket = TextEditingController();
    mapData = Get.arguments;
    print(mapData);
    super.onInit();
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

  selectFreeOrPaid(val) {
    isSelected = val;
    if (isSelected == 'Paid') {
      isFree = false;
    } else {
      isFree = true;
      priceTicket?.clear();
    }
    update();
  }

  next() {
    if (mapData['privacy'] == 'private') {
      Get.offAll(const CheckScheduleScreen(), arguments: {
        'mapData': mapData,
        'images': files,
      });
    } else {
      Get.offAll(const CheckScheduleScreen(), arguments: {
        'mapData': mapData,
        'images': files,
        'isFree': isFree,
        'priceTicket': priceTicket?.text,
      });
    }
  }
}
