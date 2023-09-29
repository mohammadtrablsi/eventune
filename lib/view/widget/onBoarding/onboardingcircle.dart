import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/auth/onboardingcontroller.dart';


// ignore: camel_case_types
class onboardingcircle extends GetView<StatelessWidget> {
  const onboardingcircle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onboardingcontroller>(builder: (controller) {
      return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            padding: EdgeInsetsDirectional.only(
              start: 2.w,
              end: 2.w,
            ),
            height: controller.indexpage == 0 ? 0.5.h : 1.h,
            width: controller.indexpage == 0 ? 8.w : 2.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: controller.indexpage == 0
                  ? Color.fromRGBO(173, 172, 172, 1)
                  : Color.fromRGBO(217, 217, 217, 1),
            ),
            duration: Duration(milliseconds: 1000),
          ),
          SizedBox(
            width: 1.w,
          ),
          AnimatedContainer(
            padding: EdgeInsetsDirectional.only(
              start: 2.w,
              end: 2.w,
            ),
            height: controller.indexpage == 1 ? 0.5.h : 1.h,
            width: controller.indexpage == 1 ? 8.w : 2.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: controller.indexpage == 1
                  ? Color.fromRGBO(173, 172, 172, 1)
                  : Color.fromRGBO(217, 217, 217, 1),
            ),
            duration: Duration(milliseconds: 1000),
          ),
          SizedBox(width: 1.w),
          AnimatedContainer(
            padding: EdgeInsetsDirectional.only(
              start: 2.w,
              end: 2.w,
            ),
            height: controller.indexpage == 2 ? 0.5.h : 1.h,
            width: controller.indexpage == 2 ? 8.w : 2.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: controller.indexpage == 2
                  ? Color.fromRGBO(173, 172, 172, 1)
                  : Color.fromRGBO(217, 217, 217, 1),
            ),
            duration: Duration(milliseconds: 1000),
          ),
        ],
      ),
    );
    });
  }
}
