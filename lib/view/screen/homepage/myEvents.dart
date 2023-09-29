import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../linkapi.dart';
import '../../../controller/homepage/myEventsController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/homepage/eventItem.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyEventsController());
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        title: Text(
          'All My Events',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<MyEventsController>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      children: [
                       
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsetsDirectional.only(top: 1.5.h),
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
                                            : "non\$",
                                        image: controller
                                                .listdata[index]['photos']!
                                                .isEmpty
                                            ? AppImageAsset.nophoto
                                            : "${AppLink.imageLink}${controller.listdata[index]['photos']?[0]['path']}",
                                        ontap: () {
                                          Get.toNamed(
                                            AppRoute.myEventDetails,
                                            arguments: [
                                              {
                                                'datalist':
                                                    controller.listdata[index],
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
                                                    .listdata[index]['name'],
                                                'id': controller.listdata[index]
                                                    ['id'],
                                                'type': controller
                                                                .listdata[index]
                                                            ['section_id'] !=
                                                        null
                                                    ? 'placed'
                                                    : 'unplaced',
                                              }
                                            ],
                                          );
                                        },
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 10,
                                        child: Container(
                                          padding: EdgeInsets.all(6.sp),
                                          decoration: BoxDecoration(
                                              color: AppColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: controller.listdata[index]
                                                      ['privacy'] !=
                                                  null
                                              ? Text(
                                                  "${controller.listdata[index]['privacy']}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )
                                              : const Text(
                                                  "custom",
                                                  style: TextStyle(
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
