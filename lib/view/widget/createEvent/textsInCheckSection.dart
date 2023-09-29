import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';

class TextsInCheckSection extends StatelessWidget {
  const TextsInCheckSection(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3});
  final text1;
  final text2;
  final text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                Text(
                  text1,
                  style: TextStyle(fontSize: 14.sp, color: AppColor.iconColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Icon(
                Icons.lens,
                color: AppColor.primaryColor,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "capicity:",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.iconColor),
              ),
              Text(
                text2,
                style: TextStyle(fontSize: 14.sp, color: AppColor.iconColor),
              )
            ],
          ),
          SizedBox(height: 2.5.h),
          Row(
            children: [
              Icon(
                Icons.lens,
                color: AppColor.primaryColor,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "price:",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.iconColor),
              ),
              Text(
                text3,
                style: TextStyle(fontSize: 14.sp, color: AppColor.iconColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
