import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemOfAcceptedStore extends StatelessWidget {
  const ItemOfAcceptedStore({super.key, required this.text1, required this.text2, required this.products, required this.location});
  final String text1;
  final String text2;
  final Widget products;
  final Widget location;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h),
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
                  location,
                  SizedBox(height: 1.h),
                  products,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

