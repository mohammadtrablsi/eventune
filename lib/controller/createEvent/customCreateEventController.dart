import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/core/functions/alert.dart';
import 'package:Eventune/core/functions/changeFormatTime.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/createEvent/customCreateEventData.dart';
import '../../view/screen/cart/allStores.dart';

class CustomCreateEventController extends GetxController {
  TextEditingController? numPerson;

  TextEditingController password = TextEditingController();
  TextEditingController? priceTicket;
  double? longitude, latitude;
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CustomCreateEventData customCreateEventData =
      CustomCreateEventData(Get.find());
  List<File?> files = [];
  var isSelected;
  String privacy = 'public';
  DateTime date = DateTime.now();
  Map mapData = {};
  bool selectedTime1 = false, selectedTime2 = false;
  bool isFree = true;
  TimeOfDay time1 =
      TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
  TimeOfDay time2 =
      TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
  @override
  void onInit() {
    numPerson = TextEditingController();
    priceTicket = TextEditingController();
    privacy = Get.arguments['privacy'];
    mapData = Get.arguments;
    mapData['type'] = 'c';
    super.onInit();
  }

  void selectDate(DateTime date) {
    this.date = date;
    print(DateFormat('yyyy-MM-dd').format(date));
    update();
  }

  void pickLocation(lon, lat) {
    longitude = lon;
    latitude = lat;
  }

  pickImage() async {
    List<XFile?> images = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        files.add(File(images[i]!.path));
      }
      print('============ $files');
      update();
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

  void customShowTimePicker(context, String state) {
    showTimePicker(
            context: context, initialTime: state == 'From' ? time1 : time2)
        .then((value) {
      if (value == null) {
        return;
      } else {
        if (state == 'From') {
          time1 = value;
          selectedTime1 = true;
        } else {
          time2 = value;
          selectedTime2 = true;
        }
        print(changeFormatTimeForBackEnd(time1));
        print(changeFormatTimeForBackEnd(time2));

        update();
      }
    });

    update();
  }

  valid() {
    // print(longitude);

    if (mapData['name'] != null &&
            mapData['description'] != null &&
            mapData['capacity'] != null &&
            changeFormatTimeForBackEnd(time1) != null &&
            changeFormatTimeForBackEnd(time2) != null &&
            (isFree || priceTicket!.text.isNotEmpty)
        // longitude != null &&
        // latitude != null &&
        ) {
      return true;
    } else {
      return false;
    }
  }

  next() async {
    alert(() async {
      if (valid()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await customCreateEventData.customCreateEventData(
            AppLink.token,
            password.text,
            mapData['name'],
            mapData['description'],
            mapData['capacity'],
            DateFormat('yyyy-MM-dd').format(date),
            changeFormatTimeForBackEnd(time1),
            changeFormatTimeForBackEnd(time2),
            priceTicket!.text,
            longitude,
            latitude,
            mapData['privacy'],
            isFree,
            files);
        print("=============================== response $response ");
        print("=============================== statusRequest $statusRequest ");
        statusRequest = handlingData(response);
        update();
        if (StatusRequest.success == statusRequest) {
          Map data = {};
          data.addAll(response);
          if (data["status"] == "success") {
            print('success.....................');
            Get.offAll(const AllStores(), arguments: {
              'type': 'c',
              'date': DateFormat('yyyy-MM-dd').format(date),
              'time': changeFormatTimeForBackEnd(time1),
              'latitude': latitude,
              'longitude': longitude
            });
            return Get.snackbar(
                backgroundColor: AppColor.primaryColor,
                colorText: Colors.white,
                "success",
                "The event has been created successfully",
                duration: const Duration(seconds: 5));
            //next.....
          } else {
            return Get.snackbar("warning", '${data['message']}',
                duration: const Duration(seconds: 5),
                backgroundColor: Colors.red.withOpacity(0.7),
                colorText: Colors.white);
          }
        } else if (statusRequest == StatusRequest.offlinefailure) {
          return Get.snackbar(
              "warning", "you are not online please check on it",
              duration: const Duration(seconds: 5));
        } else if (statusRequest == StatusRequest.serverfailure) {
          return Get.snackbar("warning", "please again later",
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.red.withOpacity(0.7),
              colorText: Colors.white);
        }
      } else {
        return Get.snackbar("warning", "please fill all field..",
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    }, 'This transaction needs to be paid if you confirm that you may lose your money and in case the operation fails you will be refunded',
        password);
  }
}
