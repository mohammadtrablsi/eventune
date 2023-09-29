import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class SuggestionItem extends StatelessWidget {
  const SuggestionItem(
      {super.key,
      required this.image,
      required this.name,
      required this.date,
      required this.price,
      required this.restcapa,
      required this.onpressed});
  final image;
  final name;
  final date;
  final price;
  final restcapa;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: EdgeInsets.zero,
          onPressed: onpressed,
          child: Column(
            children: [
              Container(
                height: 11.h,
                width: 80.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  color: AppColor.isDark==true?Colors.white12:Colors.black12,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                // height: 7.2.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(date,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 9.sp))
                      ],
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Text(
                            "price of ticket:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                            ),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 0.5.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColor.primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              restcapa,
                              style: TextStyle(
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "Tickets Remaining",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5.w),
      ],
    );
  }
}
