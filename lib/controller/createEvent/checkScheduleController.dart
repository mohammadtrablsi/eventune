import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:Eventune/data/datasource/remote/createEvent/CreateEventData.dart';
import 'package:Eventune/linkapi.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/alert.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/createEvent/freeTimeData.dart';
import '../../view/screen/cart/allStores.dart';
import '../../view/widget/store/detailsVenueOrStoreScreen.dart';

class CheckScheduleController extends GetxController {
  Map data = {};
  int numHours = 1;
  int numHoursForBackEnd = 1;
  int indexColor = 0;
  String? startTime, endTime;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateFormat timeFormat = DateFormat('HH:mm');
  DateTime? selectedDate;
  Map<String, List> myTimesAvailable = {};
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  FreeTimeEventData freeTimeEventData = FreeTimeEventData(Get.find());
  CreateEventData createEventData = CreateEventData(Get.find());
  TextEditingController passowrd = TextEditingController();
  var file;
  var price;
  var isFree = true;
  Map mapData = {};
  @override
  void onInit() {
    selectedDate = focusedDay;
    mapData = Get.arguments['mapData'];
    file = Get.arguments['images'];
    if (mapData['privacy'] != 'private') {
      isFree = Get.arguments['isFree'];
      price = Get.arguments['priceTicket'];
    }

    print(Get.arguments);
    super.onInit();
  }

  List listOfTimesAvailable(DateTime dateTime) {
    if (myTimesAvailable[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return myTimesAvailable[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  onDaySelected(selectedDay1, focusedDay1) async {
    numHours = 1;
    if (!isSameDay(selectedDate, selectedDay1)) {
      indexColor = 0;
      if (myTimesAvailable[DateFormat('yyyy-MM-dd').format(selectedDay1)] ==
          null) {
        await getCateigory(DateFormat('yyyy-MM-dd').format(selectedDay1));
        if (data['status'] == 'success') {
          getTime(DateFormat('yyyy-MM-dd').format(selectedDay1), data['data']);
        } else {
          getTime(DateFormat('yyyy-MM-dd').format(selectedDay1), []);
        }
      }
      selectedDate = selectedDay1;
      focusedDay = focusedDay1;
      update();
    }
  }

  onFormatChanged(format) {
    if (calendarFormat != format) {
      // Call `setState()` when updating calendar format
      calendarFormat = format;
      update();
    }
  }

  storeTimeForBackEnd(time, index) {
    indexColor = index;
    numHoursForBackEnd = numHours;
    startTime = time['StartTime'];
    endTime = time['EndTime'];
    update();
    print(startTime);
    print(endTime);
    print(DateFormat('yyyy-MM-dd').format(selectedDate!));
  }

  increasHours() {
    if (myTimesAvailable[DateFormat('yyyy-MM-dd').format(selectedDate!)] !=
            null &&
        numHours <
            myTimesAvailable[DateFormat('yyyy-MM-dd').format(selectedDate!)]!
                .length &&
        myTimesAvailable[DateFormat('yyyy-MM-dd').format(selectedDate!)]![
                numHours]
            .isNotEmpty) {
      numHours++;
      indexColor = 0;
      update();
    }
  }

  decreasHours() {
    if (numHours > 1) {
      numHours--;
      indexColor = 0;
      update();
    }
  }

  List freeTime = [];
  getTime(date, List time) {
    print('times.... $time');
    print(data);
    //numbers of hours
    // start of 1h
    for (int i = 0; i < time.length; i++) {
      freeTime.add([]);
      //lenght of time List
      for (int j = 0; j < time.length; j++) {
        if (i + j < time.length &&
            timeFormat
                    .parse(time[j + i])
                    .difference(timeFormat.parse(time[j]))
                    .inMinutes ==
                ((i) * 60)) {
          freeTime[i].add(
            {
              'StartTime':
                  DateFormat('HH:mm').format(timeFormat.parse(time[j])),
              'EndTime': DateFormat('HH:mm')
                  .format(timeFormat.parse(time[j]).add(Duration(hours: i + 1)))
            },
          );
        } else {
          break;
        }
      }
    }

    if (time.isNotEmpty) {
      print('======ok');
      myTimesAvailable[date] = freeTime;
    }

    freeTime = [];

    print(myTimesAvailable);
  }

  next() {
    var s = timeFormat.parse(startTime!);
    alert(() async {
      if (true) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await createEventData.createEventData(
            AppLink.token,
            passowrd.text,
            mapData['name'],
            mapData['description'],
            mapData['capacity'],
            DateFormat('yyyy-MM-dd').format(selectedDate!),
            DateFormat('HH:mm').format(s),
            numHoursForBackEnd,
            price.toString(),
            isFree,
            mapData['privacy'],
            mapData['equpement'] == 1 ? mapData['levelId'] : 0,
            mapData['id_section'],
            mapData['equpement'],
            file);
        print("=============================== response $response ");
        print("=============================== statusRequest $statusRequest ");
        statusRequest = handlingData(response);
        update();
        if (StatusRequest.success == statusRequest) {
          Map data = {};
          data.addAll(response);
          if (data["status"] == "success") {
            print('success.....................');
            if (mapData['equpement'] == 0) {
              Get.offAll(const AllStores(), arguments: {
                'venueId': mapData['venueId'],
                'type': 'p',
                'date': DateFormat('yyyy-MM-dd').format(selectedDate!),
                'time':
                    DateFormat('HH:mm').format(timeFormat.parse(startTime!)),
              });
            } else {
              Get.offAll(const DetailsVenueOrStoreScreen(), arguments: {
                'venueId': mapData['venueId'],
                'type': 'p',
                'date': DateFormat('yyyy-MM-dd').format(selectedDate!),
                'time':
                    DateFormat('HH:mm').format(timeFormat.parse(startTime!)),
              });
            }
            passowrd.clear();
            return Get.snackbar(
                backgroundColor: AppColor.primaryColor,
                colorText: Colors.white,
                "success",
                "The event has been created successfully",
                duration: const Duration(seconds: 5));
            //next.....
          } else {
            passowrd.clear();
            return Get.snackbar(
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
                "falid",
                "${data['message']}",
                duration: const Duration(seconds: 5));
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
      }
    }, 'This transaction needs to be paid if you confirm that you may lose your money and in case the operation fails you will be refunded',
        passowrd);
  }

  getCateigory(date) async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await freeTimeEventData.freeTimeEventData(
        AppLink.token,
        date,
        mapData['id_section'],
      );
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              duration: const Duration(seconds: 1));
          //next
        } else {
          return Get.snackbar("warning", data['message'],
              backgroundColor: Colors.red.withOpacity(0.7),
              colorText: Colors.white);
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
}
