import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/constData.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/color.dart';
import '../homepage/bottomnav.dart';

class MyNotificationScreen extends StatelessWidget {
  const MyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.offAll(const bottomnav());
              },
              icon: Icon(Icons.arrow_back,
                  size: 20.sp, color: AppColor.iconColor)),
          title: Text(
            'My Notifications',
            style: TextStyle(
                fontSize: 17.sp,
                color: AppColor.iconColor,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
            padding: EdgeInsetsDirectional.only(top: 0.h, start: 3.h, end: 3.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(top: 2.w),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            width: 100.w,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 2.w),
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  listNotification[index],
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColor.iconColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 2.h,),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 2.h,
                              bottom: 1.h,
                              child:  Text(listTimeNotification[index],)),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 2.h,
                      );
                    },
                    itemCount: listNotification.length,
                  ),
                ),
              ],
            )));
  }
}
