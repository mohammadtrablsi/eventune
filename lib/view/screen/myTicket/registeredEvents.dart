import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../linkapi.dart';
import '../../../controller/myTicket/registeredEventsController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/homepage/eventItem.dart';

class RegisteredEvents extends StatelessWidget {
  const RegisteredEvents({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisteredEventsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Registered Events',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<RegisteredEventsController>(
        builder: (controller) {
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                padding: EdgeInsetsDirectional.only(top: 2.5.h),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          EventItem(
                                            name: controller.listdata[index]
                                                ['name'],
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
                                                : "free",
                                            image: controller
                                                    .listdata[index]['photos']!
                                                    .isEmpty
                                                ? AppImageAsset.nophoto
                                                : "${AppLink.imageLink}${controller.listdata[index]['photos']?[0]['path']}",
                                            ontap: () {
                                              Get.toNamed(
                                                AppRoute
                                                    .registeredEventsDetails,
                                                arguments: [
                                                  {
                                                    'datalist': controller
                                                        .listdata[index],
                                                    'isMyEvent': true,
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
                                                            .listdata[index]
                                                                ['photos']!
                                                            .isEmpty
                                                        ? AppImageAsset.nophoto
                                                        : "${AppLink.imageLink}${controller.listdata[index]['photos']?[0]['path']}",
                                                    'name': controller
                                                            .listdata[index]
                                                        ['name'],
                                                    'id': controller
                                                        .listdata[index]['id'],
                                                    'type': controller.listdata[
                                                                    index][
                                                                'section_id'] !=
                                                            null
                                                        ? 'placed'
                                                        : 'unplaced',
                                                  }
                                                ],
                                              );
                                            },
                                          ),
                                          Positioned(
                                            right: 2.w,
                                            top: 1.7.h,
                                            child: Container(
                                              padding: EdgeInsets.all(8.sp),
                                              decoration: BoxDecoration(
                                                  color: AppColor.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30)),
                                              child: Text(
                                                "${controller.listdata[index]['privacy']}",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  );
                                },
                                itemCount: controller.listdata.length,
                              ),
                            ),
                          ),
                        ],
                      ),
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
