import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../controller/createEvent/insideVenueOfCategoriesController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/buttonInVenueProfile.dart';
import '../../widget/createEvent/imageAndTextInVenueProfile.dart';
import '../../widget/createEvent/rateWidget.dart';
import '../../widget/createEvent/textsInVenueProfile.dart';

class InsideVenueOfCategories extends StatelessWidget {
  const InsideVenueOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    InsideVenueOfCategoriesController controller =
        Get.put(InsideVenueOfCategoriesController());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
              child: Row(
                children: [
                  const AppbarCustom(
                    text: 'Venue Details',
                  ),
                  const Spacer(),
                  RateWidget(
                    agreepressed: () {
                      controller.replay(controller.id, "venue",
                          controller.numberstare.toString());
                      Get.back();
                    },
                    updaterating: (double value) {
                      controller.numberOfStare(value);
                    },
                    initialRating: controller.numberstare,
                  ),
                ],
              ),
            ),
            GetBuilder<InsideVenueOfCategoriesController>(
              builder: (controller) {
                return Expanded(
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 1.h, end: 1.h, top: 1.h),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(height: 2.h),
                        GetBuilder<InsideVenueOfCategoriesController>(
                            builder: (controller) {
                          return ImageAndTextInVenueProfile(
                            image: controller.photos.isEmpty
                                ? AppImageAsset.nophoto
                                : "${AppLink.imageLink}${controller.photos[controller.i]['path']}",
                            text: "${controller.name}",
                            i: controller.i,
                            leftButton: () {
                              controller.buttonforimages("left");
                            },
                            rightButton: () {
                              controller.buttonforimages("right");
                            },
                            height: 23.h,
                            width: 85.w,
                            sizeoftext: 16.sp,
                          );
                        }),
                        SizedBox(height: 5.5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.5.w),
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
                                    "venue description:",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.iconColor),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              TextsInVenuProfile(
                                text1: "${controller.description}",
                                // "${getAddress(controller.latitude, controller.longtude
                                latitude: 17.549772,
                                longtude: -4.859199,
                                phones: controller.phones,
                                sizeoftext: 15.sp,
                                resp: 2, text2: '',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.h),
                        ButtonInVenueProfile(
                          text: "See  the schedule times",
                          onpressed: () {
                            Get.toNamed(
                              AppRoute.storeMyTimes,
                              arguments: [
                                {
                                  'times': controller.times,
                                  'sat': controller.sat,
                                  'sun': controller.sun,
                                  'mon': controller.mon,
                                  'tue': controller.tue,
                                  'wen': controller.wen,
                                  'thr': controller.thr,
                                  'fri': controller.fri,
                                }
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 1.h),
                        ButtonInVenueProfile(
                          text: "See the Sections",
                          onpressed: () {
                            Get.toNamed(
                              AppRoute.allSectionOfVenueofCategories,
                              arguments: [
                                {
                                  'data': controller.mapData,
                                  'ListOf': controller.id,
                                  'name': controller.name,
                                  'ListOfData': controller.ListOfData,
                                }
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 1.h),

                        // SizedBox(
                        //   height: 5.h,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
