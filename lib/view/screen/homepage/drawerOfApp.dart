import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/services/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../controller/homepage/bottomnavcontroller.dart';
import '../../../core/constant/routes.dart';
import '../../widget/homepage/drawerItem.dart';
import 'addStoreOrVenueScreen.dart';
import 'myWalletScreen.dart';

class DrawerOfApp extends GetView<Bottomnavcontroller> {
  const DrawerOfApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return GetBuilder<Bottomnavcontroller>(builder: (controller) {
      return Drawer(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.zero,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsetsDirectional.only(start: 8.w, top: 2.h),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.clear_all_outlined,
                        size: 20.sp,
                        color: AppColor.iconColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 2.h,
              // ),
              Container(
                  padding: EdgeInsetsDirectional.only(start: 7.w),
                  child: ListTile(
                    title: Text(
                      '${myServices.sharedPreferences.getString('name')}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.iconColor,
                      ),
                    ),
                    subtitle: Text(
                      '${myServices.sharedPreferences.getString('email')}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.iconColor,
                      ),
                    ),
                  )),

              Container(
                padding: EdgeInsetsDirectional.only(start: 3.7.w, end: 5.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.wb_sunny_outlined,
                      size: 20.sp,
                      color: AppColor.iconColor,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      '1011'.tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.iconColor,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: controller.switchValue!,
                      activeColor: AppColor.primaryColor,
                      onChanged: (bool value) {
                        controller.onchangeswitchmode(value);
                      },
                    ),
                  ],
                ),
              ),

              DrawerItem(
                icon: Icons.g_translate_rounded,
                text: 'Language',
                color: AppColor.iconColor,
                splashcolor: Colors.grey,
                onpressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("choose your language:"),
                        content: SizedBox(
                          height: 18.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    controller.onchangeswitchlanguage("arabic");
                                    Get.back();
                                  },
                                  child: Text(
                                    "اللغة العربية",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: AppColor.primaryColor),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    controller
                                        .onchangeswitchlanguage("english");
                                    Get.back();
                                  },
                                  child: Text("English lanuage",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColor.primaryColor))),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              DrawerItem(
                icon: Icons.wallet,
                text: 'My wallet',
                color: AppColor.iconColor,
                splashcolor: Colors.grey,
                onpressed: () {
                  Get.offAll(const MyWalletScreen());
                },
              ),

              controller.isOwner
                  ? DrawerItem(
                      icon: Icons.work,
                      text: 'Experince owner',
                      color: AppColor.iconColor,
                      splashcolor: Colors.grey,
                      onpressed: () {
                        Get.offAll(const AddStoreOrVenueScreen());
                      },
                    )
                  : DrawerItem(
                      icon: Icons.work,
                      text: 'Account owner',
                      color: AppColor.iconColor,
                      splashcolor: Colors.grey,
                      onpressed: () {
                        controller.ownerAccount();
                      },
                    ),

              controller.isOwner
                  ? Column(
                      children: [
                        DrawerItem(
                          icon: Icons.dashboard,
                          text: "My venues",
                          color: AppColor.iconColor,
                          splashcolor: Colors.grey,
                          onpressed: () {
                            Get.toNamed(AppRoute.allMyVenues);
                          },
                        ),
                        DrawerItem(
                          icon: Icons.store,
                          text: "My stores",
                          color: AppColor.iconColor,
                          splashcolor: Colors.grey,
                          onpressed: () {
                            Get.toNamed(AppRoute.allMyStores);
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
              DrawerItem(
                icon: Icons.feedback_outlined,
                text: 'Feed back',
                color: AppColor.iconColor,
                splashcolor: Colors.grey,
                onpressed: () {
                  Get.toNamed(AppRoute.feedBack);
                },
              ),
              DrawerItem(
                icon: Icons.logout,
                text: 'Logout'.tr,
                color: Colors.red,
                splashcolor: Colors.red[200],
                onpressed: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
