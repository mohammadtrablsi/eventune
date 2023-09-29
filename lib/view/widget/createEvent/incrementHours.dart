import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class IncrementHours extends StatelessWidget {
  final int numHours;
  final void Function()? onTapPlus;
  final void Function()? onTapMinus;

  const IncrementHours({
    super.key,
    required this.numHours,
    this.onTapPlus,
    this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.2.h),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  'Number Hours : ',
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(width: 3.w,),
                 Text(
                  '${numHours}',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onTapPlus,
                    child: FaIcon(
                      Icons.arrow_drop_up,
                      size: 25.sp,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: onTapMinus,
                    child: FaIcon(
                      Icons.arrow_drop_down,
                      size: 25.sp,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
