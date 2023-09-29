import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../linkapi.dart';
import '../../../controller/homePage/searchHomePageController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/homepage/eventItem.dart';

class SearchHomePage extends StatelessWidget {
  const SearchHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchHomePageController());
    return Scaffold(
      body: GetBuilder<SearchHomePageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      const AppbarCustom(
                        text: 'Search events',
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Now Search about Events : ',
                            style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: AppColor.iconColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.5.h),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0.w),
                        ),
                        elevation: 6,
                        child: TextFormField(
                          controller: controller.homePageSearchTextController,
                          onChanged: (value) {
                            controller.getSearchCreateEvent4();
                            controller.pagination();
                          },
                          decoration: InputDecoration(
                            hintText: 'search name,des.. events ',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(143, 149, 158, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(240, 240, 240, 1),
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Color.fromRGBO(152, 141, 141, 1),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5.h),
                      ///////
                    ],
                  )),
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                        Expanded(
                          child: ListView.builder(
                            // controller: controller.scrollController,
                            padding: EdgeInsetsDirectional.only(top: 2.5.h),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  EventItem(
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
