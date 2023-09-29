import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../share/cacheImage.dart';

class CardForProduct extends StatelessWidget {
  final List<String> text;
  final String imageUrl;
  const CardForProduct({super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    List listData = ['', 'Quantity : ', 'Price : '];
    return Container(
      height: 18.h,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient:  LinearGradient(
            colors: AppColor.isDark == true
                ? [
                    Colors.white24,
                    Colors.white12,
                  ]
                : [
                    Color.fromARGB(5, 0, 0, 0),
                    Color.fromARGB(20, 0, 0, 0),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        //color: const Color.fromARGB(10, 0, 0, 0),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 23.h,
            width: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.black12),
            child: CustomCacheImage(imageUrl: imageUrl),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(3, (index) {
                return Text(
                  listData[index] + text[index],
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.iconColor,
                      fontWeight: FontWeight.w500),
                );
              }))
        ],
      ),
    );
  }
}
