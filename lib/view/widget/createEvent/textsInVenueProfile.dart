import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';
import '../../../core/functions/selectPosition.dart';

class TextsInVenuProfile extends StatelessWidget {
  const TextsInVenuProfile(
      {super.key,
      required this.text1,
      required this.phones,
      required this.sizeoftext,
      required this.resp,
      this.longtude,
      this.latitude,
      required String text2});
  final text1;
  final phones;
  final resp;
  final longtude;
  final latitude;
  final sizeoftext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 3.w),
                child: Text(
                  text1,
                  style: TextStyle(
                      fontSize: sizeoftext - 1, color: AppColor.iconColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lens,
              color: AppColor.primaryColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "location:",
              style: TextStyle(
                  fontSize: sizeoftext,
                  fontWeight: FontWeight.bold,
                  color: AppColor.iconColor),
            ),
            FutureBuilder<String>(
              future: getAddress(52.2165157, 6.9437819),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Expanded(
                    child: Text(
                      '${snapshot.data}',
                      style:
                          TextStyle(fontSize: 14.sp, color: AppColor.iconColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lens,
              color: AppColor.primaryColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "phone nember:",
              style: TextStyle(
                  fontSize: sizeoftext,
                  fontWeight: FontWeight.bold,
                  color: AppColor.iconColor),
            ),
            SizedBox(
              width: 1.w,
            ),
            Column(
              children: List.generate(phones.length, (index) {
                return Text(
                  resp == 1
                      ? phones[index].phoneNumber
                      : phones[index]['phone_number'],
                  style: TextStyle(
                      fontSize: sizeoftext, color: AppColor.iconColor),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
