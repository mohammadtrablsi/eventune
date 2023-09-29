import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/createEvent/searchAllVenueOfCategoriesController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/buttonInCreateEvent.dart';
import '../../widget/createEvent/venuItem.dart';

class SearchAllVenueOfCategories extends StatelessWidget {
  const SearchAllVenueOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchAllVenueOfCategoriesController());
    return Scaffold(
      body: GetBuilder<SearchAllVenueOfCategoriesController>(
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
                        const AppbarCustom(
                          text: 'Create Event',
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Search on venue',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.5.h),
                        SizedBox(
                          height: 8.h,
                          child: TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
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
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
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
                                        return  Center(
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
                                Container(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 3.h, end: 2.h, bottom: 4.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ButtonInCreateEvent(
                                        widget: Row(
                                          children: [
                                            Text(
                                              '1051'.tr,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        onpressed: () {
                                          // Get.toNamed(AppRoute.eventSubmitted);
                                        },
                                        radius: 30.0,
                                        paddinghorizontal: 7.w,
                                        paddingvertical: 4.w,
                                      ),
                                    ],
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
