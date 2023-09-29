import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constant/routes.dart';

import '../../../controller/cart/storeDetailsController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/buttonInVenueProfile.dart';
import '../../widget/createEvent/imageAndTextInVenueProfile.dart';
import '../../widget/createEvent/rateWidget.dart';
import '../../widget/createEvent/textsInVenueProfile.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    StoreDetailsController controller = Get.put(StoreDetailsController());
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                const AppbarCustom(
                  text: 'Store Details',
                ),
                Spacer(),
                RateWidget(
                  agreepressed: () {
                    controller.replay(controller.id, "store",
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
            GetBuilder<StoreDetailsController>(
              builder: (controller) {
                return Expanded(
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(height: 3.h),
                        GetBuilder<StoreDetailsController>(
                            builder: (controller) {
                          return ImageAndTextInVenueProfile(
                            image: controller.photos.isEmpty
                                ? AppImageAsset.nophoto
                                : "${AppLink.imageLink}${controller.photos[controller.i].path}",
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
                        Row(
                          children: [
                            Icon(
                              Icons.done_outline,
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "venue description:",
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                        TextsInVenuProfile(
                          text1: "${controller.description}",
                          text2: "${controller.latitude}",
                          phones: controller.phones,
                          sizeoftext: 15.sp,
                          resp: 1,
                        ),
                        SizedBox(height: 4.5.h),
                        ButtonInVenueProfile(
                          text: "times of Store",
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
                            // Get.toNamed(AppRoute.createEventCatigories);
                          },
                        ),
                        SizedBox(height: 2.h),
                        ButtonInVenueProfile(
                          text: "show the product",
                          onpressed: () {
                            Get.toNamed(
                              AppRoute.products,
                              arguments: [
                                {
                                  'photoOfStore': controller.photos.isEmpty
                                      ? AppImageAsset.nophoto
                                      : "${AppLink.imageLink}${controller.photos[0].path}",
                                  'products': controller.products,
                                  'data': controller.mapData,
                                  'isUser': true
                                }
                              ],
                            );
                          },
                        ),
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
