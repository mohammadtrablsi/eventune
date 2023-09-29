import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Onboardingimage extends StatelessWidget {
  const Onboardingimage({super.key, required this.image, required this.height});
  final String image;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      child: Image.asset(
        image,
        height: 40.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
