import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../linkapi.dart';
import '../../../controller/cart/allStoresController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/createEvent/venuItem.dart';
import '../homepage/bottomnav.dart';

class AllStores extends StatelessWidget {
  const AllStores({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllStoresController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(const bottomnav());
                },
                icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
            //SizedBox(width: 2.w,),
            Text(
              'All Stores',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<AllStoresController>(
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                Text(
                                  'Now choose your products from stores :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                      color: AppColor.iconColor),
                                ),
                                SizedBox(height: 3.5.h),
                                InkWell(
                                  borderRadius: BorderRadius.circular(4.w),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 3.w),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(240, 240, 240, 1),
                                        borderRadius:
                                            BorderRadius.circular(4.w)),
                                    child: const Row(
                                      children: [
                                        Text("Search Venue Here",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    143, 149, 158, 1))),
                                        Spacer(),
                                        Icon(
                                          Icons.search,
                                          color:
                                              Color.fromRGBO(152, 141, 141, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoute.searchStores,
                                        arguments: controller.mapData2);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  child: ListView.builder(
                                    controller: controller.scrollController,
                                    padding:
                                        EdgeInsetsDirectional.only(top: 3.5.h),
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
                                            controller.islist(index);
                                            Get.toNamed(
                                              AppRoute.storeDetails,
                                              arguments: [
                                                {
                                                  'data': {
                                                    'hasDelivery': controller
                                                        .insidedata[index]
                                                        .hasDelivery,
                                                    'deliveryCost': controller
                                                        .insidedata[index]
                                                        .deliveryCost,
                                                    'id': controller
                                                        .insidedata[index].id,
                                                    'venueId': controller
                                                                    .mapData[
                                                                'type'] ==
                                                            'p'
                                                        ? controller
                                                            .mapData['venueId']
                                                        : -1,
                                                    'latitude': controller
                                                                    .mapData[
                                                                'type'] ==
                                                            'c'
                                                        ? controller
                                                            .mapData['latitude']
                                                        : -1,
                                                    'longitude': controller
                                                                    .mapData[
                                                                'type'] ==
                                                            'c'
                                                        ? controller.mapData[
                                                            'longitude']
                                                        : -1,
                                                    'type': controller
                                                        .mapData['type'],
                                                    'date': controller
                                                        .mapData['date'],
                                                    'time': controller
                                                        .mapData['time'],
                                                  },
                                                  'name': controller
                                                      .insidedata[index].name,
                                                  'description': controller
                                                      .insidedata[index]
                                                      .description,
                                                  'latitude': controller
                                                      .insidedata[index]
                                                      .latitude,
                                                  'phones': controller
                                                      .insidedata[index].phones,
                                                  'id': controller
                                                      .insidedata[index].id,
                                                  'photos': controller
                                                      .insidedata[index].photos,
                                                  'times': controller.times,
                                                  'products': controller
                                                      .insidedata[index]
                                                      .products,
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
                              ],
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
