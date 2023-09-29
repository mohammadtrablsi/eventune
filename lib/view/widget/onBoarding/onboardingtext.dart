import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class onboardingtext extends StatelessWidget {
  const onboardingtext({super.key,  required this.text});
  // final String title;
  final  text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(96, 96, 96, 1),
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
