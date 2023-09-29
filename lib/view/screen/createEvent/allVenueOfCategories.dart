import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/imgaeasset.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../linkapi.dart';
import '../../../controller/createEvent/allVenueOfCategoriesController.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/buttonInCreateEvent.dart';
import '../../widget/createEvent/venuItem.dart';

class AllVenueOfCategories extends StatelessWidget {
  const AllVenueOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    AllVenueOfCategoriesController controller =
        Get.put(AllVenueOfCategoriesController());
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 4.w, right: 4.w),
        padding: EdgeInsetsDirectional.only(start: 3.h, end: 2.h, bottom: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonInCreateEvent(
              widget: Row(
                children: [
                  Text(
                    '1051'.tr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              onpressed: () {
                controller.goToCustom();
              },
              radius: 30.0,
              paddinghorizontal: 7.w,
              paddingvertical: 1.6.h,
            ),
          ],
        ),
      ),
      body: GetBuilder<AllVenueOfCategoriesController>(
        builder: (controller) {
          return Container(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        AppbarCustom(
                          text: '1030'.tr,
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                Text(
                                  '${'1050'.tr} :',
                                  style: TextStyle(
                                      fontSize: 15.sp,

                                      color: AppColor.iconColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 3.5.h),
                                InkWell(
                                  borderRadius: BorderRadius.circular(4.w),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 3.w),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1),
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
                                    Get.toNamed(
                                      AppRoute.searchAllVenueOfCategories,
                                      arguments: [
                                        {
                                          'data': controller.mapData,
                                        }
                                      ],
                                    );
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
                                              "${controller.valuesList[index][0]['name']}",
                                          image: controller
                                                  .valuesList[index][0]
                                                      ['photos']
                                                  .isEmpty
                                              ? AppImageAsset.nophoto
                                              : "${AppLink.imageLink}${controller.valuesList[index][0]['photos'][0]['path']}",
                                          ontap: () {
                                            Get.toNamed(
                                              AppRoute.insideVenueOfCategories,
                                              arguments: [
                                                {
                                                  'data': controller.mapData,
                                                  'name': controller
                                                          .valuesList[index][0]
                                                      ['name'],
                                                  'description': controller
                                                          .valuesList[index][0]
                                                      ['description'],
                                                  'latitude': controller
                                                          .valuesList[index][0]
                                                      ['latitude'],
                                                  'longitude': controller
                                                          .valuesList[index][0]
                                                      ['longitude'],
                                                  'phones': controller
                                                          .valuesList[index][0]
                                                      ['phones'],
                                                  'id': controller
                                                          .valuesList[index][0]
                                                      ['id'],
                                                  'photos': controller
                                                          .valuesList[index][0]
                                                      ['photos'],
                                                  'ListOfData': controller
                                                      .valuesList[index],
                                                 
                                                }
                                              ],
                                            );
                                          },
                                          rate: controller.valuesList[index][0]
                                                  ['rate']!
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
