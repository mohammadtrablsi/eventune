import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../core/services/services.dart';
import '../../../controller/homepage/bottomnavcontroller.dart';
import '../../../core/constant/constData.dart';
import '../../screen/notifycation/myNotificationScreen.dart';

MyServices myServices = Get.find();

class HeadAndTextfieldInHomePage extends StatelessWidget {
  const HeadAndTextfieldInHomePage(
      {super.key,
      required this.deviceType,
      required this.scaffoldKey,
      required this.ontap,
      required this.isnotex});
  final deviceType;
  final scaffoldKey;
  final void Function()? ontap;
  final isnotex;
  @override
  Widget build(BuildContext context) {
    Get.put(Bottomnavcontroller());
    return GetBuilder<Bottomnavcontroller>(builder: (controller) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(top: 4.h, start: 3.h, end: 3.h),
            height: deviceType == "mobile"
                ? (AppColor.isDark == true ? 28.5.h : 26.5.h)
                : 26.5.h,
            color: AppColor.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.clear_all_outlined,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                      onPressed: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Hi",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        Text("${myServices.sharedPreferences.get('name')}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp))
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        print(listNotification);
                        Get.to(const MyNotificationScreen());
                        numberOfNotification = 0;
                      },
                      icon: numberOfNotification != 0
                          ? badges.Badge(
                              badgeContent: Text(
                                '$numberOfNotification',
                                style: TextStyle(
                                    color: AppColor.iconColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              child: Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            )
                          : Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, 0.03.h, 0.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 3.h, start: 3.h, end: 3.h),
                  child: InkWell(
                    onTap: ontap,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0.w),
                        ),
                        elevation: 6,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.9.w, vertical: 1.7.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0.w),
                              color: const Color.fromRGBO(240, 240, 240, 1)),
                          child: Row(
                            children: [
                              Text(
                                "Search name,description,..",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color:
                                        const Color.fromRGBO(143, 149, 158, 1)),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.search,
                                color: const Color.fromRGBO(152, 141, 141, 1),
                                size: 18.sp,
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                isnotex
                    ? SizedBox(
                        height: 2.h,
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            padding: EdgeInsetsDirectional.only(
                                start: 5.h, end: 3.h),
                            child: Row(
                              children: [
                                Text(
                                  isnotex ? '' : '1020'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.iconColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 1.2.h,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
