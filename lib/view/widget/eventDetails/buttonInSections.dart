import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class ButtonInSections extends StatelessWidget {
  const ButtonInSections(
      {super.key, required this.text, required this.onpressed});
  final text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.h),
          child: MaterialButton(
            elevation: 12.0,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: onpressed,
            child: Container(
                width: double.infinity,
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ))),
          ),
        ),
        SizedBox(height: 3.h),
      ],
    );
  }
}
