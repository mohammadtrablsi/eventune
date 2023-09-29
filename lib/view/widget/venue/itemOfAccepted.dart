import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemOfAccepted extends StatelessWidget {
  const ItemOfAccepted(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.text6,
      required this.text7,
      required this.text8,
      required this.text9});
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  final String text9;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Card(
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
                    "create by: ",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    text2,
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
                    "Time: ",
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
                    "Date: ",
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
                              text8=='null'?'free':text8,
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
                    "Description:",
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
                      "$text9",
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
