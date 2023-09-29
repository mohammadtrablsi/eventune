import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCardForCart extends StatelessWidget {
  final Widget? child;
  const CustomCardForCart({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.2.h,
         // horizontal: 5.w,
        ),
        height: 16.h,
        width: 100.w,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(5, 0, 0, 0),
                Color.fromARGB(15, 0, 0, 0),
                // Color.fromARGB(5, 0, 0, 0),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: child,
        ));
  }
}
