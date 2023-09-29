import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class ButtonInVenueProfile extends StatelessWidget {
  const ButtonInVenueProfile({super.key, required this.text,required this.onpressed});
  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: MaterialButton(
            // elevation: 5.0,

            padding: EdgeInsets.symmetric(vertical: 1.h),

            color: AppColor.primaryColor,

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

            onPressed: onpressed,

            child: SizedBox(
                width: double.infinity,
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(fontSize: 15.sp, color: Colors.white,fontWeight: FontWeight.bold),
                ))),
          ),
        ),
      ],
    );
  }
}
