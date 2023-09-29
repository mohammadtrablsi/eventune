import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/color.dart';

class ListOfWeek extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final int ok;
  const ListOfWeek(
      {super.key, required this.text, this.onTap, required this.ok});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 7.h,
        width: 25.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor,width: 2 ),
          borderRadius: BorderRadius.circular(1.w),
          color: ok == 1 ? Colors.white12 : AppColor.primaryColor,
        ),
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
              fontSize: 16.sp, color: ok == 1 ? AppColor.primaryColor : Colors.white),
        ),
      ),
    );
  }
}
