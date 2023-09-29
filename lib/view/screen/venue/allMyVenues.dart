import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/venue/AllMyVenuesController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/venuItem.dart';
import '../homepage/bottomnav.dart';

class AllMyVenues extends StatelessWidget {
  const AllMyVenues({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllMyVenuesController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.offAll(const bottomnav());
            },
            icon:
                Icon(Icons.arrow_back, size: 20.sp, color: AppColor.iconColor)),
        title: Text(
          'All My Venues',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<AllMyVenuesController>(
        builder: (controller) {
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.insidedata.isNotEmpty
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 6.5.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'My veneus:',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.iconColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 0.5.h),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                      controller: controller.scrollController,
                                      padding: EdgeInsetsDirectional.only(
                                          top: 2.5.h),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index >= controller.length) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                                color: AppColor.primaryColor),
                                          );
                                        } else {
                                          return VenuItem(
                                            text:
                                                "${controller.insidedata[index].name}",
                                            image: controller.insidedata[index]
                                                    .photos!.isEmpty
                                                ? AppImageAsset.nophoto
                                                : "${AppLink.imageLink}${controller.insidedata[index].photos![0].path}",
                                            ontap: () {
                                              Get.toNamed(
                                                AppRoute.appTab,
                                                arguments: [
                                                  {
                                                    'data': controller.listData,
                                                    'name': controller
                                                        .insidedata[index].name,
                                                    'description': controller
                                                        .insidedata[index]
                                                        .description,
                                                    'latitude': controller
                                                        .insidedata[index]
                                                        .latitude,
                                                    'longitude': controller
                                                        .insidedata[index]
                                                        .longitude,
                                                    'phones': controller
                                                        .insidedata[index]
                                                        .phones,
                                                    'id': controller
                                                        .insidedata[index].id,
                                                    'photos': controller
                                                        .insidedata[index]
                                                        .photos,
                                                    'times': controller
                                                        .insidedata[index]
                                                        .times,
                                                  }
                                                ],
                                              );
                                            },
                                            rate: controller
                                                .insidedata[index].rate!
                                                .toDouble(),
                                          );
                                        }
                                      },
                                      itemCount: controller.isloadmore == true
                                          ? controller.length + 1
                                          : controller.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 90.h,
                            width: 100.w,
                            child: Center(
                              child: Image.asset(AppImageAsset.nodata),
                            ),
                          ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
