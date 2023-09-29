import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/widget/homepage/imageInEventDetails.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/deepLinkController.dart';
import '../../../controller/homepage/eventDetialsController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/buttonInCreateEvent.dart';
import 'promotScreen.dart';

class EventDetials extends StatelessWidget {
  const EventDetials({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EventDetialsController());
    return Scaffold(
      body: GetBuilder<EventDetialsController>(
        builder: (controller) {
          return RepaintBoundary(
            key: DeepLinkController.previewContainer,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        const AppbarCustom(
                          text: 'My Event Details',
                        ),
                        const Spacer(),
                        (controller.datalist['privacy'] == "public" &&
                                    controller.datalist['status'] ==
                                        "accepted") ||
                                (controller.datalist['privacy'] == "public" &&
                                    controller.datalist['typePlace'] ==
                                        "unplaced")
                            ? IconButton(
                                onPressed: () {
                                  DeepLinkController.buildDynamicLinks(
                                      'Invite By EvenTune App',
                                      '${controller.datalist['typePlace']}/${controller.datalist['id']}');
                                },
                                icon: Icon(
                                  Icons.share,
                                  size: 23.sp,
                                  color: AppColor.iconColor,
                                ))
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ImageInEventDetails(
                            image: controller.datalist['photos'].isEmpty
                                ? AppImageAsset.nophoto
                                : "${AppLink.imageLink}${controller.datalist['photos'][controller.i]['path']}",
                            i: controller.i,
                            ontap1: () {
                              controller.buttonforimages("left");
                            },
                            ontap2: () {
                              controller.buttonforimages("right");
                            },
                          ),
                          Container(
                            padding: EdgeInsetsDirectional.only(
                                top: 2.h, bottom: 4.h, start: 2.5.h, end: 1.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(75),
                                  bottomRight: Radius.circular(75),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Event's name : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp),
                                    ),
                                    Text(
                                      "${controller.datalist['name']}",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('description : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp)),
                                  ],
                                ),
                                SizedBox(
                                  height: 0.3.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.5.h),
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.datalist['description']}",
                                          style: TextStyle(fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("privacy : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp)),
                                        controller.datalist['privacy'] != null
                                            ? Text(
                                                "${controller.datalist['privacy']}",
                                                style: TextStyle(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 13.sp),
                                              )
                                            : Text(
                                                "custom",
                                                style: TextStyle(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 13.sp),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text('capacity : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp)),
                                    Text(
                                      controller.datalist['section_id'] != null
                                          ? "${controller.datalist['capacity']}"
                                          : "${controller.datalist['capacity']['capacity']}",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text('rest capacity : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp)),
                                    Text(
                                      "${controller.datalist['rest_capacity']}",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text('ticket price : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp)),
                                    Text(
                                      controller.datalist['ticket'] != null
                                          ? "${controller.datalist['ticket']['price']}\$"
                                          : "free",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text('1074'.tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp)),
                                    Text(
                                      "${controller.datalist['date']}",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                controller.datalist['section_id'] != null
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('Time :',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10.sp)),
                                              Text(
                                                "  ${controller.datalist['start_time']} to ${controller.datalist['end_time']}",
                                                style:
                                                    TextStyle(fontSize: 13.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        ],
                                      )
                                    : Container(),
                                (controller.datalist['privacy'] == "public" &&
                                            controller.datalist['status'] ==
                                                "accepted") ||
                                        (controller.datalist['privacy'] ==
                                                "public" &&
                                            controller.datalist['typePlace'] ==
                                                "unplaced")
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end: 4.w),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ButtonInCreateEvent(
                                                    widget: Row(
                                                      children: [
                                                        SizedBox(width: 5.w),
                                                        Text(
                                                          'promote my event',
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(width: 5.w),
                                                      ],
                                                    ),
                                                    onpressed: () {
                                                      Get.to(
                                                          const PromotScreen(),
                                                          arguments: {
                                                            'eventId':
                                                                controller
                                                                    .eventId,
                                                            'typePlace':
                                                                controller.type
                                                          });
                                                    },
                                                    radius: 10.0,
                                                    paddinghorizontal: 9.w,
                                                    paddingvertical: 2.w,
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      )
                                    : SizedBox(
                                        height: 2.h,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
