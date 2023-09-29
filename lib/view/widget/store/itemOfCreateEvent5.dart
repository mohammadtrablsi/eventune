import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';

class ItemOfCreateEvent5 extends StatelessWidget {
  const ItemOfCreateEvent5(
      {super.key,
      required this.name,
      required this.price,
      required this.ontap,
      required this.image,
      required this.isUser});
  final name;
  final price;
  final void Function()? ontap;
  final image;
  final isUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          padding: EdgeInsetsDirectional.only(start: 2.h, end: 2.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 4,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  start: 2.h, end: 2.h, top: 1.h, bottom: 1.h),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 1.7.h,
                        ),
                        Row(
                          children: [
                            Text("price:", style: TextStyle(fontSize: 13.sp)),
                            SizedBox(width: 1.w),
                            Text("${price}\$",
                                style: TextStyle(fontSize: 13.sp)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  isUser
                      ? InkWell(
                          onTap: ontap,
                          child: Icon(
                            Icons.add,
                            size: 28.sp,
                            color: AppColor.primaryColor,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
