import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';

class CheckBoxesInCheckSection extends StatelessWidget {
  const CheckBoxesInCheckSection(
      {required this.text1, required this.ontap, super.key});
  final text1;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 1.w, end: 1.w),
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColor.primaryColor),
          child: IntrinsicWidth(
            child: Center(
              child: Text(
                text1,
                style: TextStyle(fontSize: 13.sp, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
