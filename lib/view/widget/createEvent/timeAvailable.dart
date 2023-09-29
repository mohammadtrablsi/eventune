import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class TimesAvailable extends StatelessWidget {
  final void Function()? onTap;
  final Map data;
  final int index;

  const TimesAvailable({
    super.key,
    this.onTap,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.2.h),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: index == 1 ? AppColor.primaryColor : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.done,
                size: 25.sp,
                color: index == 1 ? Colors.white : Colors.teal,
              ),
              Row(
                children: [
                  Text(
                    'Start_Time :   ${data['StartTime']} | End_Time :   ${data['EndTime']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: index == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
