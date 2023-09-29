import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constant/color.dart';
import '../../screen/venue/updateMyTimes.dart';

class ItemOfTimeStore extends StatelessWidget {
  const ItemOfTimeStore({required this.nameOfList, super.key});
  final List nameOfList;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: nameOfList.isNotEmpty
            ? List.generate(
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
                          'isVenue': false,
                          'id': nameOfList[index]['pivot']['id'],
                          'times': {
                            'start_time': nameOfList[index]['pivot']
                                ['start_time'],
                            'end_time': nameOfList[index]['pivot']['end_time'],
                          }
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.h, vertical: 1.h),
                          child: Row(
                            children: [
                              Text(
                                "${nameOfList[index]['pivot']['start_time']}",
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
                              Spacer(),
                              Text(
                                "${nameOfList[index]['pivot']['end_time']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              )
            : [
                Text(
                  "No Times in this day",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                )
              ]);
  }
}
