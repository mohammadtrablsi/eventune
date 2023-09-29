import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/widget/myOrder/rowText.dart';
import 'package:sizer/sizer.dart';

class CardOrder extends StatelessWidget {
  final String time;
  final String storeName;
  final orderLocation;
  final String phone;
  final String price;
  const CardOrder(
      {super.key,
      required this.time,
      required this.storeName,
      required this.orderLocation,
      required this.phone,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: AppColor.isDark == true
                ? [
                    Colors.white54,
                    // Colors.white24,
                    Colors.white38,
                  ]
                : [
                    const Color.fromARGB(20, 0, 0, 0),
                    const Color.fromARGB(5, 0, 0, 0),
                    const Color.fromARGB(20, 0, 0, 0),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(30),
        //  color: const Color.fromARGB(10, 0, 0, 0),
      ),
      height: 30.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RowText(
            text1: 'time',
            text2: time,
          ),
          RowText(
            text1: 'store name',
            text2: storeName,
          ),
          orderLocation,
          RowText(
            text1: 'Contact information',
            text2: phone,
          ),
          // Divider(thickness: 1,height: 15,color: Colors.black38,),
          RowText(
            text1: 'Total payment',
            text2: '$price sp',
          ),
        ],
      ),
    );
  }
}
