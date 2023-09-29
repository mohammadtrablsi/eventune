import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RowTextForCart extends StatelessWidget {
  final String text1;
  final String text2;

  const RowTextForCart({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black38,
          ),
        ),
        Text(
          '$text2 \$',
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
