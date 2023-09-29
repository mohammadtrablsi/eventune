import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class CustomButtonForCreatEvent extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonForCreatEvent(
      {super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.w),
      child: Container(
        width: 100.w,
        height: 7.h,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular( 7.h/2.3)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          onPressed: onPressed,
          // color: AppColor.primaryColor,
          child: Center(
            child: Text(text,
                style:  TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
