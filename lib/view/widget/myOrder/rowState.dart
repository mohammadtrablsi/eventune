import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/myOrder/pointStateOrder.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class RowState extends StatelessWidget {
  final int numState;
  const RowState({super.key, required this.numState});

  @override
  Widget build(BuildContext context) {
    return numState==0?SizedBox(height: 4.h,):Row(
      children: [
        PointStateOrder(
            nameState: 'Pending', numberState: numState == 1 ? 1 : 0),
        Expanded(
            child: Container(
              height: 2,
              width: 4.w,
              color:AppColor.isDark==true?Colors.white38 :Colors.black12,
            )),
        PointStateOrder(
            nameState: 'Accepted', numberState: numState == 2 ? 1 : 0),
        Expanded(
            child: Container(
              height: 2,
              width: 2.w,
              color:AppColor.isDark==true?Colors.white38 :Colors.black12,
            )),
        PointStateOrder(
            nameState: 'Rejected', numberState: numState == 3 ? 1 : 0),
      ],
    );
  }
}
