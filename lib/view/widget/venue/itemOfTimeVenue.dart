import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constant/color.dart';

class ItemOfTimevenu extends StatelessWidget {
  const ItemOfTimevenu({required this.nameOfList, super.key});
  final List nameOfList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        nameOfList.length,
        (index) => Column(
          children: [
            SizedBox(
              height: 1.5.h,
            ),
            Container(
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                child: Row(
                  children: [
                    Text(
                      "${nameOfList[index].pivot.startTime}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Text(
                      "${nameOfList[index].pivot.endTime}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
