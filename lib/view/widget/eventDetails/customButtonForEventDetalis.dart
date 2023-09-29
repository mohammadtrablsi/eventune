import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class CustomButtonForEventDetails extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final type;
  const CustomButtonForEventDetails(
      {super.key, required this.text, this.onPressed, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 7.h,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: onPressed,
        color: type == 1 || type == null
            ? AppColor.primaryColor
            : Colors.redAccent,
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
