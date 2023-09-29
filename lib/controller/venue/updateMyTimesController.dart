import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/changeFormatTime.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/venue/updateVenueTimesData.dart';

class UpdateMyTimesController extends GetxController {
  var startTime;
  var endTime;
  bool isVenue = false;
  bool selectedTime1 = true, selectedTime2 = true;
  late TimeOfDay time1;
  late TimeOfDay time2;

  List times = [];
  int? day;
  String? idTime;
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UpdateTimeData updateTimeData = UpdateTimeData(Get.find());
  @override
  void onInit() {
    startTime = Get.arguments['times']['start_time'];
    endTime = Get.arguments['times']['end_time'];
    day = Get.arguments['day'];
    isVenue = Get.arguments['isVenue'];
    idTime = Get.arguments['id'].toString();

    List<String> timeParts = startTime.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    time1 = TimeOfDay(hour: hour, minute: minute);
    List<String> timeParts2 = endTime.split(':');
    int hour1 = int.parse(timeParts2[0]);
    int minute1 = int.parse(timeParts2[1]);
    time2 = TimeOfDay(hour: hour1, minute: minute1);

    super.onInit();
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
    List<String> timeParts = startTime.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    TimeOfDay time3 = TimeOfDay(hour: hour, minute: minute);
    List<String> timeParts2 = endTime.split(':');
    int hour1 = int.parse(timeParts2[0]);
    int minute1 = int.parse(timeParts2[1]);
    TimeOfDay time4 = TimeOfDay(hour: hour1, minute: minute1);
    if (time1 != time3 || time2 != time4) {
      return true;
    }
    return false;
  }

  next() async {
    if (valid()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updateTimeData.updateTimeData(
          AppLink.token,
          changeFormatTimeForBackEnd(time1),
          changeFormatTimeForBackEnd(time2),
          idTime,
          isVenue,
          day);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      Map data = {};
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          print('success.....................');
          Get.back();
          return Get.snackbar("success", "Updated Successfuly",
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
      } else {
        return Get.snackbar(
            "warning", "please fill the startTime and the endTime",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } else {
      return Get.snackbar(
          "warning", "please change the startTime or the endTime or both",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }
}
