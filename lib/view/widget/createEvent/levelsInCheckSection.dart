import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class LevelsInCheckSection extends StatelessWidget {
  const LevelsInCheckSection(
      {super.key,
      required this.textLevel,
      required this.textPrice,
      required this.ontap});
  final textLevel;
  final textPrice;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: ontap,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    18), // Set the border radius you desire
              ),
              elevation: 4.0,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.7.h),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "level: ",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 25.w,
                              child: Text("$textLevel",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16.sp)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "price: ",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                "$textPrice\$",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
        SizedBox(
          height: 1.5.h,
        ),
      ],
    );
  }
}
