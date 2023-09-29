import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/venue/selectAvailableTimeController.dart';
import '../../../core/functions/changeFormatTime.dart';
import '../createEvent/customButtonForCreateEvent.dart';

class AddNewTime extends StatelessWidget {
  final Animation<double> animation;
  final int index;
  final void Function()? onTap;
  const AddNewTime({
    super.key,
    required this.animation,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SelectAvailableTimeController());
    return GetBuilder<SelectAvailableTimeController>(builder: (controller) {
      return FadeTransition(
          opacity: animation,
          child: SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButtomForCreateEvent(
                          icon: FontAwesomeIcons.solidClock,
                          text: controller.selectTime[controller.numberDay][index][0]
                              ? changeFormatTime(controller
                                  .time[controller.numberDay][index][0])
                              : 'From',
                          onPressed: () async {
                            controller.customShowTimePicker(
                                context, 'From', index);
                          }),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: CustomButtomForCreateEvent(
                          icon: FontAwesomeIcons.solidClock,
                          text: controller.selectTime[controller.numberDay][index][1]
                              ? changeFormatTime(controller
                                  .time[controller.numberDay][index][1])
                              : 'To',
                          onPressed: () async {
                            controller.customShowTimePicker(
                                context, 'To', index);
                          }),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Icon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.redAccent,
                        size: 16.sp,
                      ),
                    )
                  ],
                ),
              )));
    });
  }
}
