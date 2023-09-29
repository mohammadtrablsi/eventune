import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class RateWidget extends StatelessWidget {
  const RateWidget(
      {super.key,
      required this.agreepressed,
      required this.updaterating,
      required this.initialRating});
  final void Function()? agreepressed;
  final void Function(double) updaterating;
  final initialRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    // title: Icon(
                    //   Icons.sentiment_dissatisfied,
                    //   size: 50.sp,
                    //   color: Colors.red,
                    // ),
                    content: Container(
                      width: double.infinity,
                      height: 17.h,
                      child: Column(
                        children: [
                          RatingBar(
                            minRating: 1.0,
                            initialRating: initialRating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full:  Icon(
                                Icons.star,
                                color: AppColor.primaryColor,
                              ),
                              half:  Icon(
                                Icons.star_half,
                                color: AppColor.primaryColor,
                              ),
                              empty: const Icon(
                                Icons.star_border,
                              ),
                            ),
                            onRatingUpdate: updaterating,
                            itemSize: 32.sp,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "cancel",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.red[500]),
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextButton(
                                  onPressed: agreepressed,
                                  child: Text(
                                    "agree",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColor.primaryColor),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.grade,
              color: AppColor.primaryColor,
              size: 25.sp,
            ))
      ],
    );
  }
}
