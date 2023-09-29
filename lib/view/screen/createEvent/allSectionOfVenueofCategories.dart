import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/createEvent/allSectionOfVenueOfCategoriesController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/sectionItem.dart';

class AllSectionOfVenueofCategories extends StatelessWidget {
  const AllSectionOfVenueofCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllSectionOfVenueOfCategoriesController());
    return Scaffold(
      body: GetBuilder<AllSectionOfVenueOfCategoriesController>(
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
                        const AppbarCustom(
                          text: 'Sections',
                        ),
                      ],
                    )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'The Section : ',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: AppColor.iconColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              padding: EdgeInsetsDirectional.only(top: 3.5.h),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    child: SectionItem(
                                      text:
                                          "${controller.ListOfData[index + 1]['name']['name']}",
                                      image: controller
                                              .ListOfData[index + 1]['photos']
                                              .isEmpty
                                          ? AppImageAsset.nophoto
                                          : "${AppLink.imageLink}${controller.ListOfData[index + 1]['photos'][0]['path']}",
                                    ),
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoute.insideSectionOfCategories,
                                        arguments: [
                                          {
                                            'data': controller.mapData,
                                            'name': controller.name,
                                            'MapOfData': controller
                                                .ListOfData[index + 1],
                                          }
                                        ],
                                      );
                                    });
                              },
                              itemCount: controller.ListOfData.length - 1,
                            ),
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
