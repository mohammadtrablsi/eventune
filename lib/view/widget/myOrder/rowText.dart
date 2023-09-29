import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';



class RowText extends StatelessWidget {
  final String text1;
  final String text2;
  const RowText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$text1 : ',
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
                fontSize: 15.sp,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
