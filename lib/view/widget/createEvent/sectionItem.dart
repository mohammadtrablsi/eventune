import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({super.key, required this.text, required this.image});
  final String text;
  final image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0.w),
          ),
          elevation: 7,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 12.h,
                  // width: 85.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0.w),
                      topRight: Radius.circular(5.0.w),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                      top: 3.w, bottom: 4.w, start: 2.h, end: 4.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0.w),
                        bottomRight: Radius.circular(5.0.w),
                      ),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 1.8.h),
      ],
    );
  }
}
