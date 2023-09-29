import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:Eventune/core/class/handlingdataview.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/screen/createEvent/allVenueOfCategories.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/createEvent/customCreateEventController.dart';
import '../../../core/functions/changeFormatTime.dart';
import '../../widget/createEvent/customButtonForCreateEvent.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/createEvent/customDropDownButtonForCreateEvent.dart';
import '../../widget/createEvent/rowTextAndTextField.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class CustomCreateEventScreen extends StatelessWidget {
  const CustomCreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomCreateEventController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:   IconButton(
                onPressed: () {
                  Get.off(const AllVenueOfCategories());

                },
                icon: Icon(Icons.arrow_back, size: 20.sp, color: AppColor.iconColor)),
        title: Text(
          '1040'.tr,
          style: TextStyle(
              fontSize: 17.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<CustomCreateEventController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: ListView(
                children: [
                  Text(
                    '1032'.tr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalendarTimeline(
                          lastDate: DateTime(2080, DateTime.now().month, 20),
                          initialDate: controller.date,
                          firstDate: DateTime.now(),
                          onDateSelected: (date) {
                            controller.selectDate(date);
                          },
                          leftMargin: 1.w,
                          monthColor: Colors.black54,
                          dayColor: AppColor.primaryColor,
                          dayNameColor: Colors.white60,
                          activeDayColor: Colors.white,
                          activeBackgroundDayColor: AppColor.primaryColor,
                          dotsColor: AppColor.iconColor,
                          locale: 'en',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButtomForCreateEvent(
                                  icon: FontAwesomeIcons.solidClock,
                                  text: controller.selectedTime1
                                      ? changeFormatTime(controller.time1)
                                      : 'From',
                                  onPressed: () async {
                                    controller.customShowTimePicker(
                                        context, 'From');
                                  }),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: CustomButtomForCreateEvent(
                                  icon: FontAwesomeIcons.solidClock,
                                  text: controller.selectedTime2
                                      ? changeFormatTime(controller.time2)
                                      : 'To',
                                  onPressed: () async {
                                    controller.customShowTimePicker(
                                        context, 'To');
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomButtomForCreateEvent(
                            icon: FontAwesomeIcons.fileImage,
                            text: '1033'.tr,
                            onPressed: () {
                              controller.pickImage();
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomButtomForCreateEvent(
                            icon: FontAwesomeIcons.locationDot,
                            text: '1030'.tr,
                            onPressed: () {
                              try {
                                Get.bottomSheet(Container(
                                  height: 90.h,
                                  width: 100.w,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(2.w))),
                                  child: OpenStreetMapSearchAndPick(
                                    locationPinIconColor: Colors.red,
                                    center: LatLong(33.513805, 36.276527),
                                    buttonColor: AppColor.primaryColor,
                                    buttonText: 'Set Current Location',
                                    onPicked: (pickedData) async {
                                      controller.pickLocation(
                                          pickedData.latLong.longitude,
                                          pickedData.latLong.latitude);
                                      var location =
                                          pickedData.address.split(',');
                                      for (var element in location) {
                                        print(element);
                                      }
                                      Get.back();
                                    },
                                  ),
                                ));
                              } catch (e) {
                                print('Error in map $e');
                              }
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                        controller.privacy == 'public'
                            ? CustomDropDownButtonForCreateEvent(
                                hintText: '${'1036'.tr}/${'1035'.tr}',
                                listData: const ['Paid', 'Free'],
                                isSelected: controller.isSelected,
                                onChanged: (val) {
                                  controller.selectFreeOrPaid(val);
                                })
                            : const SizedBox(),
                        controller.isFree
                            ? const SizedBox()
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  RowTextAndTextField(
                                    controller: controller.priceTicket!,
                                    hintTextField: '200\$',
                                    icon: FontAwesomeIcons.dollarSign,
                                    text: 'Price ticket',
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: controller.isFree ? 15.5.h : 7.h,
                        ),
                        CustomButtonForCreatEvent(
                            text: '1040'.tr,
                            onPressed: () {
                              controller.next();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
