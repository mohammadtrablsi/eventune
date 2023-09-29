import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/store/searchStoresController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/venuItem.dart';

class SearchStores extends StatelessWidget {
  const SearchStores({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchStoresController());
    return Scaffold(
      body: GetBuilder<SearchStoresController>(
        builder: (controller) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        AppbarCustom(
                          text: '1049'.tr,
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '1050'.tr,
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.5.h),
                        TextFormField(
                          onChanged: (value) {
                            controller.clearValuesListAndFetchData();
                          },
                          controller: controller.venueSearchTextController,
                          decoration: InputDecoration(
                            hintText: 'search venue here',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(143, 149, 158, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(240, 240, 240, 1),
                            suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(152, 141, 141, 1),
                                ),
                                onPressed: () {}),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    )),
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
                                controller: controller.scrollController,
                                padding: EdgeInsetsDirectional.only(top: 3.5.h),
                                itemBuilder: (BuildContext context, int index) {
                                  if (index >= controller.length) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                          color: AppColor.primaryColor),
                                    );
                                  } else {
                                    return VenuItem(
                                      text:
                                          "${controller.insidedata[index].name}",
                                      image: controller
                                              .insidedata[index].photos!.isEmpty
                                          ? AppImageAsset.nophoto
                                          : "${AppLink.imageLink}${controller.insidedata[index].photos![0].path}",
                                      ontap: () {
                                        controller.islist(index);
                                        Get.toNamed(
                                          AppRoute.storeDetails,
                                          arguments: [
                                            {
                                              'data': {
                                                'hasDelivery':
                                                    controller.listdata[index]
                                                        ['hasDelivery'],
                                                'deliveryCost':
                                                    controller.listdata[index]
                                                        ['deliveryCost'],
                                                'id': controller
                                                    .insidedata[index].id,
                                                'venueId': controller
                                                            .mapData['type'] ==
                                                        'p'
                                                    ? controller
                                                        .mapData['venueId']
                                                    : -1,
                                                'latitude': controller
                                                            .mapData['type'] ==
                                                        'c'
                                                    ? controller
                                                        .mapData['latitude']
                                                    : -1,
                                                'longitude': controller
                                                            .mapData['type'] ==
                                                        'c'
                                                    ? controller
                                                        .mapData['longitude']
                                                    : -1,
                                                'type':
                                                    controller.mapData['type'],
                                                'date':
                                                    controller.mapData['date'],
                                                'time':
                                                    controller.mapData['time'],
                                              },
                                              'name': controller
                                                  .insidedata[index].name,
                                              'description': controller
                                                  .insidedata[index]
                                                  .description,
                                              'latitude': controller
                                                  .insidedata[index].latitude,
                                              'phones': controller
                                                  .insidedata[index].phones,
                                              'id': controller
                                                  .insidedata[index].id,
                                              'times': controller.times,
                                              'photos': controller
                                                  .insidedata[index].photos,
                                              'products': controller
                                                  .insidedata[index].products,
                                            }
                                          ],
                                        );
                                      },
                                      rate: controller.insidedata[index].rate!
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
