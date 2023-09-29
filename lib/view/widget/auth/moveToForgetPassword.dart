import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class MoveToForgetpassword extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MoveToForgetpassword({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text(
         "",
          style:  TextStyle(
            fontSize: 12.sp,
          ),
        ),
        InkWell(
            onTap: onTap,
            child:
                Text(text, style:  TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600, color:AppColor.primaryColor))),
      ],
    );
  }
}
