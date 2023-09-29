import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/homepage/bottomnavcontroller.dart';

class BottomNavOfApp extends GetView<Bottomnavcontroller> {
  const BottomNavOfApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Bottomnavcontroller());
    return GetBuilder<Bottomnavcontroller>(builder: (controller) {
      return BottomAppBar(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 9.h,
          // transform: deviceType == "small mobile"
          //     ? Matrix4.translationValues(0.0, 0.0.h, 0.0)
          //     : Matrix4.translationValues(0.0, 2.2.h, 0.0),
          child:
              Row(
                  children: [
            Container(
              width: 20.w,
              child: InkWell(
                focusColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  controller.changepage(0);
                },
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                     size: AppColor.isDark==true?23.sp:25.sp,
                    Icons.home,
                    color: controller.currentpage == 0
                        ? AppColor.primaryColor
                        : AppColor.iconColor,
                  ),
                  Text(
                    '10'.tr,
                    style: TextStyle(
                        color: controller.currentpage == 0
                             ? AppColor.primaryColor
                        : AppColor.iconColor,
                        fontSize: AppColor.isDark==true?10.sp:11.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Container(
              width: 20.w,
              child: InkWell(
                focusColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  controller.changepage(1);
                },
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                   size: AppColor.isDark==true?23.sp:25.sp,
                    Icons.date_range_outlined,
                    color: controller.currentpage == 1
                        ? AppColor.primaryColor
                        : AppColor.iconColor,
                  ),
                  Text(
                    '1008'.tr,
                    style: TextStyle(
                        color: controller.currentpage == 1
                            ? AppColor.primaryColor
                        : AppColor.iconColor,
                        fontSize: AppColor.isDark==true?10.sp:11.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Container(
              width: 20.w,
              child: Column(
                children: [
                  RawMaterialButton(
                    elevation: 5,
                    onPressed: () {
                      // controller.changepage(2);
                      controller.to_apear_two_buttons();
                    },
                    shape: const CircleBorder(),
                    fillColor: Colors.white,
                    padding: EdgeInsets.all(1.3.w),
                    child: Icon(
                      size: 33.sp,
                      Icons.add,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              width: 20.w,
              child: InkWell(
                focusColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  controller.changepage(3);
                },
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                     size: AppColor.isDark==true?23.sp:25.sp,
                    Icons.shopping_cart_outlined,
                    color: controller.currentpage == 3
                         ? AppColor.primaryColor
                        : AppColor.iconColor,
                  ),
                  Text(
                    'My Orders',
                    style: TextStyle(
                        color: controller.currentpage == 3
                             ? AppColor.primaryColor
                        : AppColor.iconColor,
                        fontSize:AppColor.isDark==true?10.sp:11.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Container(
              width: 20.w,
              child: InkWell(
                focusColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  controller.changepage(4);
                },
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    size: AppColor.isDark==true?23.sp:25.sp,
                    Icons.confirmation_number_outlined,
                    color: controller.currentpage == 4
                        ? AppColor.primaryColor
                        : AppColor.iconColor,
                  ),
                  Text(
                    '1010'.tr,
                    style: TextStyle(
                        color: controller.currentpage == 4
                               ? AppColor.primaryColor
                        : AppColor.iconColor,
                        fontSize: AppColor.isDark==true?10.sp:11.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
