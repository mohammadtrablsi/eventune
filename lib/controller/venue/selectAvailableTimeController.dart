import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/linkapi.dart';
import 'package:Eventune/view/screen/store/addProductScreen.dart';
import 'package:Eventune/view/screen/venue/AddsectionVenueScreen.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/changeFormatTime.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/venue/addTimeScheduleData.dart';
import '../../view/widget/venue/addNewTime.dart';

class SelectAvailableTimeController extends GetxController {
  late List selectTime = [];
  late List<List<List<TimeOfDay>>> time = [];
  List<List> startTime = [[], [], [], [], [], [], []];
  List<List> endTime = [[], [], [], [], [], [], []];
  List dayofWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  late List length = [1, 1, 1, 1, 1, 1, 1];
  int numberDay = 0;
  bool isVenue = true;
  Map data = {};
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddTimeSchedule addTimeSchedule = AddTimeSchedule(Get.find());
  late List<GlobalKey<AnimatedListState>> key;
  @override
  void onInit() {
    key = [
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
    ];
    if (myServices.sharedPreferences.getString('type') == 'venue') {
      isVenue = true;
      print('===1');
    } else {
      print('===2');

      isVenue = false;
    }
    initialData();
    super.onInit();
  }

  void fillStartAndEndTimeList() {
    for (int i = 0; i < 7; i++) {
      startTime[i].clear();
      endTime[i].clear();
      for (int j = 0; j < time[i].length - 1; j++) {
        if (selectTime[i][j][0] && selectTime[i][j][1]) {
          startTime[i].add(changeFormatTimeForBackEnd(time[i][j][0]));
          endTime[i].add(changeFormatTimeForBackEnd(time[i][j][1]));
        }
      }
    }

    print('====================== $startTime');
    print('====================== $endTime');
  }

  void customShowTimePicker(
    context,
    String state,
    int index,
  ) {
    showTimePicker(
            context: context,
            initialTime: state == 'From'
                ? time[numberDay][index][0]
                : time[numberDay][index][1])
        .then((value) {
      if (value == null) {
        return;
      } else {
        if (state == 'From') {
          time[numberDay][index][0] = value;
          selectTime[numberDay][index][0] = true;
        } else {
          time[numberDay][index][1] = value;
          selectTime[numberDay][index][1] = true;
        }
        // fillStartAndEndTimeList();
        update();
      }
    });

    update();
  }

  updateNumDay(index) {
    numberDay = index;
    update();
  }

  addTime() {
    if (length[numberDay] < 5) {
      time[numberDay].insert(length[numberDay], [
        TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
        TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute)
      ]);
      selectTime[numberDay].insert(length[numberDay], [false, false]);

      key[numberDay]
          .currentState!
          .insertItem(0, duration: const Duration(seconds: 1));
      length[numberDay]++;
      update();
    } else {
      return Get.defaultDialog(
          content: const Text('only you can select 5 times'));
    }

    // print('==================================');
    // fillStartAndEndTimeList();
    // print('==================================');
  }

  removeTime(int index, BuildContext context) {
    if (length[numberDay] > 1) {
      length[numberDay]--;
      time[numberDay].removeAt(index);
      selectTime[numberDay].removeAt(index);
      key[numberDay].currentState!.removeItem(0, (_, animation) {
        return AddNewTime(
          index: index,
          animation: animation,
        );
      }, duration: const Duration(seconds: 1));
      update();
      print("================== ${length[numberDay]}");
    }
    print(time);
    print(selectTime);
  }

  valid() {
    for (int i = 0; i < startTime.length; i++) {
      for (int j = 0; j < startTime[i].length; j++) {
        if (startTime[i].length != endTime[i].length ||
            startTime[i].isEmpty ||
            endTime[i].isEmpty) {
          startTime = [[], [], [], [], [], [], []];
          endTime = [[], [], [], [], [], [], []];
          return false;
        }
      }
    }
    return true;
  }

  next() async {
    fillStartAndEndTimeList();
    if (valid()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addTimeSchedule.addTimeSchedule(
        AppLink.token,
        startTime,
        endTime,
        isVenue
            ? myServices.sharedPreferences.getInt('venueId')
            : myServices.sharedPreferences.getInt('storeId'),
        isVenue,
      );
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          print('success.....................');

          if (myServices.sharedPreferences.getString('type') == 'venue') {
            myServices.sharedPreferences.setInt('venue', 4);
            Get.offAll(
              const SectionVenueScreen(),
            );
          } else {
            myServices.sharedPreferences.setInt('store', 4);

            Get.offAll(
              const AddProductScreen(),
            );
          }

          return Get.snackbar("success",
              "${data['message']}\n The next is add information the section",
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
    } else {
      return Get.snackbar(
          "warning", "please fill the startTime and the endTime",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  //==========================================================
  initialData() {
    for (int i = 0; i < 7; i++) {
      selectTime.add(
        [
          [false, false],
          [false, false],
        ],
      );
    }
    for (int i = 0; i < 7; i++) {
      time.add(
        [
          [
            TimeOfDay(
                hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
            TimeOfDay(
                hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute)
          ],
          [
            const TimeOfDay(hour: 12, minute: 00),
            const TimeOfDay(hour: 12, minute: 00),
          ]
        ],
      );
    }
  }
}
