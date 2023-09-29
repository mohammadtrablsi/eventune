import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          borderRadius: BorderRadius.circular(15),
          onTap: ontap,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    15.0), // Set the border radius you desire
              ),
              elevation: 4.0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Text(
                        "level: ",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text("$textLevel", style: TextStyle(fontSize: 16.sp)),
                      Spacer(),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      Spacer(),
                      Text(
                        "price: ",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        "$textPrice",
                        style: TextStyle(fontSize: 16.sp),
                      )
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
