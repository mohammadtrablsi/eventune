import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomButtomAddNewTime extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButtomAddNewTime({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 7.w,
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.add,
                size: 20.sp,
              )),
        ),
      ],
    );
  }
}
