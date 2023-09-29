import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/store/updateStoreScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/store/StoresProfileController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/buttonInVenueProfile.dart';
import '../../widget/createEvent/imageAndTextInVenueProfile.dart';
import '../../widget/createEvent/textsInVenueProfile.dart';

class StoresProfile extends StatelessWidget {
  const StoresProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoresProfileController());
    return Scaffold(
      body: GetBuilder<StoresProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(start: 3.h, end: 3.h, top: 3.h),
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  GetBuilder<StoresProfileController>(builder: (controller) {
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
                      height: 19.h,
                      width: 68.w,
                      sizeoftext: 16.sp,
                    );
                  }),
                  SizedBox(height: 3.h),
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
                        "store description:",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.iconColor),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(const UpdateStoreScreen(),
                                arguments: controller.data);
                          },
                          icon: Icon(
                            Icons.edit_note,
                            color: AppColor.iconColor,
                            size: 27.sp,
                          ))
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  TextsInVenuProfile(
                    text1: "${controller.description}",
                    text2: "${controller.latitude}",
                    phones: controller.phones,
                    sizeoftext: 12.sp,
                    resp: 1,
                  ),
                  SizedBox(height: 4.5.h),
                  ButtonInVenueProfile(
                    text: 'Store Times',
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
                  SizedBox(height: 2.h),
                  ButtonInVenueProfile(
                    text: 'My Products',
                    onpressed: () {
                      Get.toNamed(
                        AppRoute.createEvent5,
                        arguments: [
                          {
                            'products': controller.products,
                            'photoOfStore': controller.photos.isEmpty
                                ? AppImageAsset.nophoto
                                : "${AppLink.imageLink}${controller.photos[0].path}",
                            'isUser': false,
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
    );
  }
}
