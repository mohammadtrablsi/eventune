import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../../../core/functions/selectPosition.dart';

class ImageAndDiscrebtion extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  final bool isAddress;
  final double latitude;
  final double longitude;
  const ImageAndDiscrebtion(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.isAddress,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15.w,
          height: 8.h,
          decoration: BoxDecoration(
              color: AppColor.isDark != true
                  ? const Color.fromARGB(13, 0, 0, 0)
                  : Colors.white10,
              borderRadius: BorderRadius.circular(3.w)),
          child: Icon(
            icon,
            size: 30,
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        SizedBox(
          width: 35.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  text1,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.iconColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              isAddress == true
                  ? SizedBox(
                      width: 35.w,
                      child: FutureBuilder<String>(
                        future: getAddress(52.2165157, 6.9437819),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(
                              backgroundColor: AppColor.primaryColor,
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Text(
                              '${snapshot.data}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.iconColor),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            );
                          }
                        },
                      ),
                    )
                  : Text(
                      text2,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.iconColor),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
