import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/widget/homepage/responsive.dart';
import 'package:Eventune/view/widget/homepage/suggestionItem.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../controller/homePage/homePageController.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/homepage/eventItem.dart';
import '../../widget/homepage/handlingDataViewHomepage.dart';
import '../../widget/homepage/headAndTextfieldInHomePage.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    final mediaQueryData = MediaQuery.of(context);
    final deviceType = getdevicetype(mediaQueryData);
    return Scaffold(
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                HeadAndTextfieldInHomePage(
                  deviceType: deviceType,
                  scaffoldKey: scaffoldKey,
                  ontap: () {
                    Get.toNamed(AppRoute.searchHomePage);
                  },
                  isnotex: controller.listdata2.isEmpty ? true : false,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        controller.statusRequest2 == StatusRequest.loading
                            ? SizedBox(
                                height: 21.h,
                                child: ListView.builder(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 3.h),
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        baseColor: Colors.grey.withOpacity(
                                            0.25), // The color of the non-animated content
                                        highlightColor:
                                            Colors.white.withOpacity(0.6),
                                        period: const Duration(seconds: 2),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              height: 18.h,
                                              width: 80
                                                  .w, // The background color of the container
                                            ),
                                            SizedBox(width: 5.w),
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : controller.listdata2.isEmpty
                                ? SizedBox(
                                    height: 0.h,
                                  )
                                : SizedBox(
                                    // padding: EdgeInsets.only(left: 3.5.w),
                                    height: 21.h,
                                    child: ListView.builder(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 4.3.h),
                                        itemCount: controller.listdata2.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return SuggestionItem(
                                              image: controller
                                                      .listdata2[index]
                                                          ['photos']!
                                                      .isEmpty
                                                  ? AppImageAsset.nophoto
                                                  : "${AppLink.imageLink}${controller.listdata2[index]['photos']?[0]['path']}",
                                              name: controller.listdata2[index]
                                                  ['name'],
                                              date:
                                                  "${controller.listdata2[index]['date']}  in ${controller.listdata2[index]['start_time']}",
                                              price: controller.listdata2[index]
                                                          ['ticket'] !=
                                                      null
                                                  ? "${controller.listdata2[index]['ticket']['price']}\$"
                                                  : "non\$",
                                              restcapa: controller
                                                              .listdata2[index]
                                                          ['rest_capacity'] !=
                                                      null
                                                  ? "${controller.listdata2[index]['rest_capacity']}"
                                                  : "non",
                                              onpressed: () {
                                                Get.toNamed(
                                                  AppRoute.eventDetails,
                                                  arguments: [
                                                    {
                                                      'datalist': controller
                                                          .listdata2[index],
                                                      'isMyEvent': false,
                                                    }
                                                  ],
                                                );
                                              });
                                        }),
                                  ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HandlingDataViewHomePage(
                          statusRequest: controller.statusRequest1,
                          loadingWidget: Flexible(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 7,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Shimmer.fromColors(
                                    direction: ShimmerDirection.ttb,
                                    baseColor: Colors.grey.withOpacity(
                                        0.25), // The color of the non-animated content
                                    highlightColor:
                                        Colors.white.withOpacity(0.6),
                                    period: const Duration(seconds: 2),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 5.w, end: 5.w, top: 2.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(12.w)),
                                        height: 26.h,
                                        width: 85
                                            .w, // The background color of the container
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          widget: Flexible(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: controller.listdata.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return EventItem(
                                    name: controller.listdata[index]['name'],
                                    date:
                                        "${controller.listdata[index]['date']}  in ${controller.listdata[index]['start_time']}",
                                    number: controller.listdata[index]
                                                ['rest_capacity'] !=
                                            null
                                        ? "${controller.listdata[index]['rest_capacity']}"
                                        : "non",
                                    price: controller.listdata[index]
                                                ['ticket'] !=
                                            null
                                        ? "${controller.listdata[index]['ticket']['price']}\$"
                                        : "non\$",
                                    image: controller
                                            .listdata[index]['photos']!.isEmpty
                                        ? AppImageAsset.nophoto
                                        : "${AppLink.imageLink}${controller.listdata[index]['photos']?[0]['path']}",
                                    ontap: () {
                                      Get.toNamed(
                                        AppRoute.eventDetails,
                                        arguments: [
                                          {
                                            'datalist':
                                                controller.listdata[index],
                                            'isMyEvent': false,
                                          }
                                        ],
                                      );
                                    },
                                    ontap2: () {
                                      Get.toNamed(
                                        AppRoute.chat,
                                        arguments: [
                                          {
                                            'image': controller
                                                    .listdata[index]['photos']!
                                                    .isEmpty
                                                ? AppImageAsset.nophoto
                                                : "${AppLink.imageLink}${controller.listdata[index]['photos']?[0]['path']}",
                                            'name': controller.listdata[index]
                                                ['name'],
                                            'id': controller.listdata[index]
                                                ['id'],
                                            'type': controller.listdata[index]
                                                        ['section_id'] !=
                                                    null
                                                ? 'placed'
                                                : 'unplaced',
                                          }
                                        ],
                                      );
                                    },
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
