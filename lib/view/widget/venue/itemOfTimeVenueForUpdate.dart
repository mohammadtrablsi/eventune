import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constant/color.dart';
import '../../screen/venue/updateMyTimes.dart';

class ItemOfTimevenuForUpdate extends StatelessWidget {
  const ItemOfTimevenuForUpdate(
      {required this.nameOfList, super.key, this.onPressed});
  final List nameOfList;
  final void Function()? onPressed;

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
            InkWell(
              onTap: () {
                Get.to(const UpdateMyTimesScreen(), arguments: {
                  'day': index,
                  'isVenue': true,
                  'id': nameOfList[index].pivot.id,
                  'times': {
                    'start_time': nameOfList[index].pivot.startTime,
                    'end_time': nameOfList[index].pivot.endTime,
                  }
                });
              },
              child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsetsDirectional.only(
                      start: 2.w, top: 1.h, bottom: 1.h, end: 2.w),
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
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
