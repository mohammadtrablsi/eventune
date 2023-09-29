import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class MoveToSignupOrLogin extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MoveToSignupOrLogin({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text == '6'.tr ? "8".tr : '5'.tr,
          style: TextStyle(
              fontSize: AppColor.isDark == true ? 10.sp : 12.sp,
              color: AppColor.iconColor),
        ),
        InkWell(
            onTap: onTap,
            child: Text(text,
                style: TextStyle(
                    fontSize: AppColor.isDark == true ? 11.sp : 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor))),
      ],
    );
  }
}
