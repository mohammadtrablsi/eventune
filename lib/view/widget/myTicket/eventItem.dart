import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class EventItem extends StatelessWidget {
  const EventItem({super.key,required this.name,required this.date,required this.number,final this.price,required this.image,required this.ontap,required this.ontap2});
  final name;
  final date;
  final number;
  final price;
  final image;
  final void Function()? ontap;
  final void Function()? ontap2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: ontap,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 15.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                      top: 3.w, bottom: 3.w, start: 2.h, end: 5.h),
                  // height: 11.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.sp),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                price,
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(width: 3.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 0.5.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  number,
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1.w),
                              const Text("Ticket Remaining"),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        child: const Icon(
                          Icons.chat,
                          color: Color.fromRGBO(126, 79, 239, 1),
                        ),
                        onTap: ontap2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
         SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}

