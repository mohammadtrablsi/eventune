import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          child: Icon(
            Icons.arrow_back,
            size: 19.sp,
            color: AppColor.iconColor,
          ),
          onTap: () {
            Get.back();
          },
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColor.iconColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
