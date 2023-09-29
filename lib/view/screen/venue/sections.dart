import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/venue/sectionsController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/eventDetails/buttonInSections.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SectionsController());
    return Scaffold(
      body: GetBuilder<SectionsController>(
        builder: (controller) {
          return Container(
              padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const AppbarCustom(
                    text: "section",
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "My sections:",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColor.iconColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Expanded(
                    child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        controller: controller.scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: controller.isloadmore == true
                            ? controller.length + 1
                            : controller.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= controller.length) {
                            return Center(
                              child: CircularProgressIndicator(
                                  color: AppColor.primaryColor),
                            );
                          } else {
                            return ButtonInSections(
                              text: controller.insidedata[index].name?.name,
                              onpressed: () {
                                Get.toNamed(
                                  AppRoute.checkSection,
                                  arguments: [
                                    {
                                      'data': controller.listData[index],
                                      'description': controller
                                          .insidedata[index].description,
                                      'capicty':
                                          controller.insidedata[index].capacity,
                                      'price':
                                          controller.insidedata[index].price,
                                      'photos':
                                          controller.insidedata[index].photos,
                                      'categoriesPivot': controller
                                          .insidedata[index].categoriesPivot,
                                      'name': controller
                                          .insidedata[index].name?.name,
                                    }
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
