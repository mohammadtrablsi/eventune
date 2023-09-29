import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/widget/createEvent/customTextFormFieldForCreateEvent.dart';
import 'package:sizer/sizer.dart';

import '../constant/color.dart';

alert(onPressed, msg, controller) {
  Get.defaultDialog(
      title: "Enter Your Password To Sure",
      titleStyle:
          TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: msg,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextFormFieldForCreateEvent(
            text: 'Enter Your Password To Sure', controller: controller),
      ),
      titlePadding: EdgeInsets.only(top: 2.h),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: onPressed,
            child: const Text("sure")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              Get.back();
            },
            child: const Text("cancle"))
      ]);
}

alert2(
  onPressed,
  msg,
) {
  Get.defaultDialog(
      title: "Alert",
      titleStyle:
          TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: msg,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: onPressed,
            child: const Text("sure")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              Get.back();
            },
            child: const Text("cancle"))
      ]);
}
