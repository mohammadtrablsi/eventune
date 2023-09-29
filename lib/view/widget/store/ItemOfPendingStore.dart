import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';

class ItemOfPendingStore extends StatelessWidget {
  const ItemOfPendingStore(
      {super.key,
      required this.text1,
      required this.location,
      required this.products,
      required this.acceptPressed,
      required this.rejectpressed,
      required this.textcontroller});
  final String text1;
  final Widget location;
  final Widget products;
  final void Function()? acceptPressed;
  final void Function()? rejectpressed;
  final textcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 6,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  start: 2.h, end: 2.h, top: 2.5.h, bottom: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Time: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        text1,
                        style: TextStyle(fontSize: 13.sp, color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  location,
                  SizedBox(height: 1.h),
                  products,
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
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
                                    height: 14.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Are you sure to accept",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: acceptPressed,
                                                child: Text(
                                                  "ok",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: AppColor
                                                          .primaryColor),
                                                )),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  "no",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.red),
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
                          child: Text(
                            "Accept",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(width: 4.w),
                      TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Icon(
                                    Icons.sentiment_dissatisfied,
                                    size: 50.sp,
                                    color: Colors.red,
                                  ),
                                  content: Container(
                                    height: 17.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "The reason for rejecting\nthe event",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        TextFormField(
                                          onTapOutside: (event) =>
                                              FocusScope.of(context).unfocus(),
                                          controller: textcontroller,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0.0),
                                            filled: true,
                                            fillColor: Colors.grey[
                                                200], // Set the fill color to gray
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide
                                                  .none, // Remove the border
                                              borderRadius: BorderRadius.circular(
                                                  8.0), // Apply rounded corners
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                onPressed: rejectpressed,
                                                child: Text(
                                                  "send",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.red),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Reject",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
