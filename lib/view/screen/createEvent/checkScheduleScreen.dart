import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:Eventune/core/class/statusrequest.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:Eventune/view/widget/createEvent/incrementHours.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../controller/createEvent/checkScheduleController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/createEvent/timeAvailable.dart';
import '../../widget/createEvent/msgForTimeAvailable.dart';

class CheckScheduleScreen extends StatelessWidget {
  const CheckScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckScheduleController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(const bottomnav());
                },
                icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
            Text(
              'Create event',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<CheckScheduleController>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: StatusRequest.success,
          widget: Stack(
            children: [
              ListView(
                children: [
                  TableCalendar(
                    headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                          fontSize: 17.sp,
                        ),
                        formatButtonTextStyle: TextStyle(
                          fontSize: 13.sp,
                        )),
                    firstDay: DateTime.now(),
                    lastDay:
                        DateTime(DateTime.now().year, DateTime.now().month + 2),
                    focusedDay: controller.focusedDay,
                    calendarStyle: const CalendarStyle(
                      markersMaxCount: 0,
                    ),
                    calendarFormat: controller.calendarFormat,
                    onDaySelected: (selectedDay, focusedDay) {
                      // Call `setState()` when updating the selected day
                      controller.onDaySelected(selectedDay, focusedDay);
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDate, day);
                    },
                    onFormatChanged: (format) {
                      // Call `setState()` when updating calendar format
                      controller.onFormatChanged(format);
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      controller.focusedDay = focusedDay;
                    },
                    eventLoader: controller.listOfTimesAvailable,
                  ),
                  MsgForTimeAvailable(
                      state: controller
                              .listOfTimesAvailable(controller.selectedDate!)
                              .isNotEmpty
                          ? 1
                          : 0),
                  IncrementHours(
                    numHours: controller.numHours,
                    onTapMinus: () {
                      controller.decreasHours();
                    },
                    onTapPlus: () {
                      controller.increasHours();
                    },
                  ),
                  SizedBox(
                    height: 0.2.h,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.myTimesAvailable[
                                DateFormat('yyyy-MM-dd')
                                    .format(controller.selectedDate!)] !=
                            null
                        ? controller
                            .myTimesAvailable[DateFormat('yyyy-MM-dd')
                                    .format(controller.selectedDate!)]![
                                controller.numHours - 1]!
                            .length
                        : 0,
                    itemBuilder: (context, index) {
                      return TimesAvailable(
                        index: controller.indexColor == index ? 1 : 0,
                        onTap: () {
                          controller.storeTimeForBackEnd(
                              controller.myTimesAvailable[
                                      DateFormat('yyyy-MM-dd')
                                          .format(controller.selectedDate!)]
                                  ?[controller.numHours - 1][index],
                              index);
                        },
                        data: controller.myTimesAvailable[
                                DateFormat('yyyy-MM-dd')
                                    .format(controller.selectedDate!)]
                            ?[controller.numHours - 1][index],
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomButtonForCreatEvent(
                        text: 'Make Reservation',
                        onPressed: () {
                          controller.next();
                        }),
                  )),
            ],
          ),
        );
      }),
    );
  }
}
