import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';


class AMessage extends StatelessWidget {
  const AMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Material(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    elevation: 5,
                    color: AppColor.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        width: 40.w,
                        child: Text(
                          'hfjhjhhfjhhfjnnnnnnnnnnnnnnnnnnnnnnnnnnnn',
                          style: TextStyle(
                            fontSize:11.5.sp,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          // SizedBox(width: 2.w),
          // Container(
          //   transform: Matrix4.translationValues(0.0, 2.5.h, 0.0),
          //   width: 10.0.w,
          //   height: 10.0.w,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage(AppImageAsset.catawiki),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
