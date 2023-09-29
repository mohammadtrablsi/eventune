import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/venue/updateSectionScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/venue/checkSectionController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/imageInCheckSection.dart';
import '../../widget/createEvent/levelsInCheckSection.dart';
import '../../widget/createEvent/textsInCheckSection.dart';
import '../../widget/store/checkBoxesInCheckSection.dart';

class CheckSection extends StatelessWidget {
  const CheckSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(checkSectionController());
    return Scaffold(body: GetBuilder<checkSectionController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 3.h),
                  child: const AppbarCustom(
                    text: 'Section',
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Get.to(const UpdateSectionScreen(),
                          arguments: controller.data);
                    },
                    icon: Icon(
                      Icons.edit_note,
                      color: AppColor.iconColor,
                      size: 27.sp,
                    )),
              ],
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
                      height: 3.h,
                    ),
                    ImageInCheckSection(
                      image: controller.photos.isEmpty
                          ? AppImageAsset.nophoto
                          : "${AppLink.imageLink}${controller.photos[controller.i].path}",
                      i: controller.i,
                      ontap1: () {
                        controller.buttonforimages("left");
                      },
                      ontap2: () {
                        controller.buttonforimages("right");
                      },
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "${controller.name}",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.iconColor),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
                      child: Column(
                        children: [
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
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.iconColor),
                              )
                            ],
                          ),
                          SizedBox(height: 2.h),
                          TextsInCheckSection(
                            text1: "${controller.description}",
                            text2: '${controller.capicty}',
                            text3: '${controller.price}',
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Categories:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: AppColor.iconColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                    spacing: 6.0, // Spacing between columns
                                    runSpacing: 6.0,
                                    children: List.generate(
                                        controller.categoriesPivot.length,
                                        (index) {
                                      return CheckBoxesInCheckSection(
                                        text1:
                                            "${controller.categoriesPivot[index].category.name}",
                                        ontap: () {
                                          controller.getIndex(index);
                                        },
                                      );
                                    })),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GetBuilder<checkSectionController>(
                              builder: (controller) {
                            return Column(
                              children: [
                                Column(
                                  children: List.generate(
                                    controller.categoriesPivot[controller.Index]
                                        .levels.length,
                                    (index) => LevelsInCheckSection(
                                      textLevel: controller
                                          .categoriesPivot[controller.Index]
                                          .levels[index]
                                          .level,
                                      textPrice: controller
                                          .categoriesPivot[controller.Index]
                                          .levels[index]
                                          .price,
                                      ontap: () {},
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
