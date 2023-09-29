import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constant/color.dart';

class ItemOfAppTabOfTimevenu extends StatelessWidget {
  const ItemOfAppTabOfTimevenu(
      {required this.colors,
      required this.index,
      super.key,
      required this.text,
      required this.ontap});
  final text;
  final void Function()? ontap;
  final index;
  final List colors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
            color: colors[index] == true ? AppColor.primaryColor : Colors.white,
            padding: EdgeInsets.all(5.w),
            child: Text(
              text,
              style: TextStyle(
                  color: colors[index] == true ? Colors.white : Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
            )));
  }
}
