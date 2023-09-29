import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/venue/selectAvailableTimeController.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/venue/addNewTime.dart';
import '../../widget/venue/customButtomAddNewTime.dart';
import '../../widget/venue/listOfWeek.dart';
import '../homepage/bottomnav.dart';

class SelectAvailableTimeScreen extends StatelessWidget {
  const SelectAvailableTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectAvailableTimeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(const bottomnav());
                },
                icon: Icon(Icons.arrow_back,
                    size: 20.sp, color: AppColor.iconColor)),
            Text(
              'Add My Times',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColor.iconColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<SelectAvailableTimeController>(builder: (controller) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: ListView(
                children: [
                  Text(
                    'Now select the venue information :',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 10.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ListOfWeek(
                            text: controller.dayofWeek[index],
                            ok: controller.numberDay == index ? 1 : 0,
                            onTap: () {
                              controller.updateNumDay(index);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 2.w,
                          );
                        },
                        itemCount: 7),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Now select the available time :',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        AnimatedList(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            key: controller.key[controller.numberDay],
                            initialItemCount:
                                controller.length[controller.numberDay],
                            itemBuilder: (((context, index, animation) {
                              return AddNewTime(
                                index: index,
                                animation: animation,
                                onTap: () {
                                  controller.removeTime(index, context);
                                },
                              );
                            }))),
                        SizedBox(
                          height: 5.h,
                        ),
                        controller.length[controller.numberDay] <= 4
                            ? CustomButtomAddNewTime(onPressed: () {
                                controller.addTime();
                              })
                            : const SizedBox(),
                        SizedBox(
                          height: 7.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 3.h, left: 5.w, right: 5.w),
                child: CustomButtonForCreatEvent(
                    text: 'Next',
                    onPressed: () {
                      controller.next();
                    }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
