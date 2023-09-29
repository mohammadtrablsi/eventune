import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class ItemOfPending extends StatelessWidget {
  const ItemOfPending(
      {super.key,
      required this.text1,
      required this.text4,
      required this.text5,
      required this.text6,
      required this.text3,
      required this.text7,
      required this.text8,
      required this.acceptPressed,
      required this.rejectpressed,
      required this.text9,
      required this.textcontroller});
  final text1;
  final text3;
  final text4;
  final text5;
  final text6;
  final text7;
  final text8;
  final String text9;
  final textcontroller;
  final void Function()? acceptPressed;
  final void Function()? rejectpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h, top: 1.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 6,
        child: Container(
          padding: EdgeInsetsDirectional.only(
              start: 2.h, end: 2.h, top: 2.5.h, bottom: 0.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Name: ",
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
              Row(
                children: [
                  Text(
                    "privacy:",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    text3,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    "Capacity: ",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    text4,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    "period: ",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    text5,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 1.h),
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
                    text6,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  )
                ],
              ),
              text7 != 'null'
                  ? Column(
                      children: [
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Text(
                              "In level: ",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              text7,
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(),
              text3 == "public"
                  ? Column(
                      children: [
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Text(
                              "Ticket price: ",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              text8,
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    "description:",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 0.5.h),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 2.h),
                child: Column(
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text9,
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                height: 13.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Are you sure to accept : ",
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
                                                  color: AppColor.primaryColor),
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
                                height: 22.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      controller: textcontroller,
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
              SizedBox(
                height: 0.5.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
