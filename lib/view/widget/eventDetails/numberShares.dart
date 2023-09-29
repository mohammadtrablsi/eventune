import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class NumberSharesInEvent extends StatelessWidget {
  final String numPersons;
  const NumberSharesInEvent({super.key, required this.numPersons});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.h - 3.h,
      left: 10.w,
      right: 10.w,
      child: Container(
        height: 6.h,
        width: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: AppColor.isDark != true
                      ? const Color.fromARGB(20, 0, 0, 0)
                      : Colors.white12,
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset:const  Offset(0, 5))
            ],
            borderRadius: BorderRadius.circular(20.w)),
        child: Text(
          ' +$numPersons Going',
          style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.bold,color: AppColor.textColor),
        ),
      ),
    );
  }
}
