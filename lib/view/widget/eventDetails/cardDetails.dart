import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/eventDetails/imageAndDiscrebtion.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CardDetails extends StatelessWidget {
  final String priceTicket;
  final String location1;
  final String location2;
  final String timeEvent;
  final String dateEvent;
  final String nameEvent;
  final double latitude;
  final double longitude;

  const CardDetails(
      {super.key,
      required this.priceTicket,
      required this.location1,
      required this.location2,
      required this.timeEvent,
      required this.dateEvent,
      required this.nameEvent,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: AppColor.isDark == true ? 31.h : 30.h,
          child: Card(
            color: AppColor.isDark != true
                ? Colors.white
                : const Color.fromARGB(255, 31, 29, 29),
            elevation: 4,
            borderOnForeground: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nameEvent,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.iconColor),
                      ),
                      Row(
                        children: [
                          Text(
                            'price: ',
                            style: TextStyle(
                                fontSize: 15.sp, color: AppColor.iconColor),
                          ),
                          Text(
                            priceTicket,
                            style: TextStyle(
                                fontSize: 15.sp, color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ImageAndDiscrebtion(
                      isAddress: false,
                      latitude: 0,
                      longitude: 0,
                      icon: Icons.calendar_month,
                      text1: dateEvent,
                      text2: timeEvent),
                  ImageAndDiscrebtion(
                      isAddress: true,
                      latitude: latitude,
                      longitude: longitude,
                      icon: Icons.location_on,
                      text1: location1,
                      text2: location2),
                  SizedBox(
                    height: 1.h,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -3.h,
            left: 35.w,
            //right:35.w,
            child: Container(
              width: 6.h,
              height: 6.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.h / 2),
                  border: Border.all(color: Colors.black12),
                  color: Theme.of(context).scaffoldBackgroundColor),
            )),
        Positioned(
            bottom: -3.h,
            left: 35.w,
            child: Container(
              width: 6.h,
              height: 6.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.h / 2),
                  border: Border.all(color: Colors.black12),
                  color: Theme.of(context).scaffoldBackgroundColor),
            ))
      ],
    );
  }
}
