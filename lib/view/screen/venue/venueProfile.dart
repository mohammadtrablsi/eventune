import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/venue/updateVenueScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/venue/venueProfileController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../linkapi.dart';
import '../../widget/createEvent/buttonInVenueProfile.dart';
import '../../widget/createEvent/imageAndTextInVenueProfile.dart';
import '../../widget/createEvent/textsInVenueProfile.dart';

class VenueProfile extends StatelessWidget {
  const VenueProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VenueProfileController());
    return Scaffold(
      body: GetBuilder<VenueProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(start: 3.h, end: 3.h, top: 3.h),
              child: Column(
                children: [
                  GetBuilder<VenueProfileController>(builder: (controller) {
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
                      height: 20.h,
                      width: 80.w,
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
                        "venue description:",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.iconColor),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(const UpdateVenueScreen(),
                                arguments: controller.dataMap);
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
                    text2: "",
                    latitude: double.parse(controller.latitude),
                    longtude: double.parse(controller.longitude),
                    phones: controller.phones,
                    sizeoftext: 12.sp,
                    resp: 1,
                  ),
                  SizedBox(height: 4.5.h),
                  ButtonInVenueProfile(
                    text: 'my times',
                    onpressed: () {
                      Get.toNamed(
                        AppRoute.venueMyTimes,
                        arguments: [
                          {
                            'sat': controller.sat,
                            'sun': controller.sun,
                            'mon': controller.mon,
                            'tue': controller.tue,
                            'wen': controller.wen,
                            'thr': controller.thr,
                            'fri': controller.fri,
                            'data': controller.dataMap
                          }
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 1.5.h),
                  ButtonInVenueProfile(
                    text: "Check my sections",
                    onpressed: () {
                      Get.toNamed(
                        AppRoute.sections,
                        arguments: [
                          {
                            'id': controller.id,
                            'name': controller.name,
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
