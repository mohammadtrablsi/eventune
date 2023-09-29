import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomButtomForCreateEvent extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  const CustomButtomForCreateEvent({super.key, this.onPressed, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: 6.5.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(3.5.h), top: Radius.circular(2.h)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 1), color: Colors.black26, blurRadius: 1.2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.5.w),
              child: InkWell(onTap: onPressed, child: FaIcon(icon,color:AppColor.primaryColor,size:17.sp,)),
            ),
          ],
        ));
  }
}

