import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/venue/updateMyTimesController.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/changeFormatTime.dart';
import '../../widget/createEvent/customButtonForCreateEvent.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';


class UpdateMyTimesScreen extends StatelessWidget {
  const UpdateMyTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateMyTimesController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon:
                Icon(Icons.arrow_back, size: 20.sp, color: AppColor.iconColor)),
        title: Text(
          'Edite My Times',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<UpdateMyTimesController>(builder: (controller) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
              child: ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
