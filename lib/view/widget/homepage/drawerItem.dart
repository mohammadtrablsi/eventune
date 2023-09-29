import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.color,
      required this.splashcolor,
      required this.onpressed});
  final icon;
  final String text;
  final color;
  final Color? splashcolor;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: splashcolor,
      onPressed: onpressed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: color,
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
