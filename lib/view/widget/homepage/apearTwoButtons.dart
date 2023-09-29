import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/screen/createEvent/createEvent1Screen.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/homepage/bottomnavcontroller.dart';

class ApearTwoButtons extends GetView<Bottomnavcontroller> {
  const ApearTwoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(start: 5.1.h, end: 1.6.h),
          transform: Matrix4.translationValues(4.w, 91.h, 0.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),

            decoration: BoxDecoration(
              // color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),

            width: double.infinity,

            //  height: 200,

            child: Container(
              padding: EdgeInsetsDirectional.only(end: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                      elevation: 5,
                      onPressed: () {
                        // Do something when the button is pressed
                        Get.offAll(const CreateEvent1Screen(),
                            arguments: {'privacy': 'private'});
                      },
                      shape: const CircleBorder(), // Set the shape to a circle

                      fillColor: AppColor.primaryColor
                          .withOpacity(controller.isPressed
                              ? 0.0
                              : 1.0), // Set the fill color of the button

                      padding: EdgeInsets.all(
                          1.5.w), // Set the padding of the button

                      child: Container(
                          decoration: BoxDecoration(
                            // borderRadius:
                            //     BorderRadius.circular(360),
                            shape: BoxShape.circle,
                            color: Colors.white
                                .withOpacity(controller.isPressed ? 0.0 : 1.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 2.5.h),
                          child: Text(
                            '1021'.tr,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(
                                  controller.isPressed ? 0.0 : 1.0),
                            ),
                          ))),
                  RawMaterialButton(
                      elevation: 5,
                      onPressed: () {
                        // Do something when the button is pressed
                        Get.offAll(const CreateEvent1Screen(),
                            arguments: {'privacy': 'public'});
                      },
                      shape: const CircleBorder(), // Set the shape to a circle

                      fillColor: AppColor.primaryColor
                          .withOpacity(controller.isPressed
                              ? 0.0
                              : 1.0), // Set the fill color of the button

                      padding: EdgeInsets.all(
                          1.5.w), // Set the padding of the button

                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                                .withOpacity(controller.isPressed ? 0.0 : 1.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.3.w, vertical: 2.5.h),
                          child: Center(
                            child: Text(
                              "public",
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(
                                    controller.isPressed ? 0.0 : 1.0),
                              ),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
