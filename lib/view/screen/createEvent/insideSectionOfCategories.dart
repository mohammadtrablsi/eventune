import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/createEvent/insideSectionOfCategoriesController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/imageInCheckSection.dart';
import '../../widget/createEvent/levelsInCheckSection.dart';
import '../../widget/createEvent/textsInCheckSection.dart';

class InsideSectionOfCategories extends StatelessWidget {
  const InsideSectionOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InsideSectionOfCategoriesController());
    return Scaffold(body: GetBuilder<InsideSectionOfCategoriesController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 3.h),
              child: const AppbarCustom(
                text: 'Section',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    ImageInCheckSection(
                      image: controller.MapOfData['photos'].isEmpty
                          ? AppImageAsset.nophoto
                          : "${AppLink.imageLink}${controller.MapOfData['photos'][controller.i]['path']}",
                      i: controller.i,
                      ontap1: () {
                        controller.buttonforimages("left");
                      },
                      ontap2: () {
                        controller.buttonforimages("right");
                      },
                    ),
                    SizedBox(height: 1.5.h),
                    Text(
                      "${controller.MapOfData['name']['name']}",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.iconColor),
                    ),
                    SizedBox(height: 1.5.h),
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  // top: BorderSide(width: 0.4, color: AppColor.primaryColor), // Adjust the width and color of the top border
                                  bottom: BorderSide(
                                      width: 0.7,
                                      color: AppColor
                                          .primaryColor), // Adjust the width and color of the bottom border
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.lens,
                                        color: AppColor.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "Section description:",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3.h),
                                  TextsInCheckSection(
                                    text1:
                                        "${controller.MapOfData['description']}",
                                    text2:
                                        '${controller.MapOfData['capacity']}',
                                    text3: '${controller.MapOfData['price']}',
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Event equpement",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(20),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Set the border radius you desire
                                    ),
                                    elevation: 4.0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 2.h),
                                        child: Text(
                                          "equpement from board",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ))),
                                onTap: () {
                                  controller.goToScheduleTime(false, 0);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          GetBuilder<InsideSectionOfCategoriesController>(
                              builder: (controller) {
                            return Column(
                              children: [
                                Column(
                                  children: List.generate(
                                    controller
                                        .MapOfData['categories_pivot'][0]
                                            ['levels']
                                        .length,
                                    (index) => LevelsInCheckSection(
                                      textLevel: controller
                                              .MapOfData['categories_pivot'][0]
                                          ['levels'][index]['level'],
                                      textPrice: controller
                                              .MapOfData['categories_pivot'][0]
                                          ['levels'][index]['price'],
                                      ontap: () {
                                        controller.goToScheduleTime(
                                          true,
                                          controller
                                                  .MapOfData['categories_pivot']
                                              [0]['levels'][index]['id'],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        );
      },
    ));
  }
}
