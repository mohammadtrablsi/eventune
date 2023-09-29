import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/detailsEvent/eventDetailsScreenControllerForInvite.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/eventDetails/aboutAndChat.dart';
import '../../widget/eventDetails/customButtonForEventDetalis.dart';
import '../../widget/eventDetails/customAppBar.dart';
import '../../widget/eventDetails/imageAndDiscrebtion.dart';
import '../../widget/eventDetails/nameEvent.dart';
import '../../widget/eventDetails/numberShares.dart';
import '../../widget/share/cacheImage.dart';

class EventDetailsForInviteScreen extends StatelessWidget {
  const EventDetailsForInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EventDetailsScreenForInviteController());
    return GetBuilder<EventDetailsScreenForInviteController>(
        builder: (controller) {
      return Scaffold(
          body: RepaintBoundary(
              key: controller.previewContainer,
              child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Stack(
                  children: [
                    ListView(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                color: Colors.black12,
                                height: 30.h,
                                width: double.infinity,
                                child: CustomCacheImage(
                                  imageUrl: (controller.mapData['photos'] ==
                                              null ||
                                          controller.mapData['photos'].isEmpty)
                                      ? AppImageAsset.nophoto
                                      : "${AppLink.imageLink}${controller.mapData['photos']?[0]['path']}",
                                )),
                            CustomAppBarEventDetalis(
                                numPage: 1,
                                onPressedBack: () {
                                  // Get.back();
                                },
                                onPressedShare: () {
                                  controller.shareScreen();
                                }),
                            NumberSharesInEvent(
                              numPersons:
                                  controller.mapData['rest_capacity'] != null
                                      ? "${controller.mapData['rest_capacity']}"
                                      : "0",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              NameEvent(
                                text: controller.mapData['name'] ?? '',
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 14.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ImageAndDiscrebtion(
                                            isAddress: false,
                                            latitude: 0,
                                            longitude: 0,
                                            icon: Icons.calendar_month,
                                            text1: controller.mapData['date'] ??
                                                '',
                                            text2: controller
                                                        .mapData['section'] !=
                                                    null
                                                ? '${controller.mapData['start_time']} to ${controller.mapData['end_time']}'
                                                : '${controller.mapData['start_time']} to ${controller.mapData['end_time']}'),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        ImageAndDiscrebtion(
                                          isAddress: true,
                                          latitude: controller
                                                      .mapData['section'] !=
                                                  null
                                              ? double.parse(
                                                  controller.mapData['section']
                                                      ['venue']['latitude'])
                                              : double.parse(controller
                                                      .mapData['latitude'] ??
                                                  '0.0'),
                                          longitude: controller
                                                      .mapData['section'] !=
                                                  null
                                              ? double.parse(
                                                  controller.mapData['section']
                                                      ['venue']['longitude'])
                                              : double.parse(controller
                                                      .mapData['longitude'] ??
                                                  '0.0'),
                                          icon: Icons.location_on,
                                          text1: controller
                                                      .mapData['section'] !=
                                                  null
                                              ? '${controller.mapData['section']['venue']['name']} - section${controller.mapData['section']['id']}'
                                              : 'unPlaced',
                                          text2: controller
                                                      .mapData['section'] !=
                                                  null
                                              ? '${controller.mapData['section']['venue']['name']} - section${controller.mapData['section']['id']}'
                                              : 'unPlaced',
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        ImageAndDiscrebtion(
                                            isAddress: false,
                                            latitude: 0,
                                            longitude: 0,
                                            icon: Icons.person,
                                            text1: 'sameh abo reeh',
                                            text2: controller.mapData['user'] !=
                                                    null
                                                ? controller.mapData['user']
                                                    ['name']
                                                : ''),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  AboutEventAndChat(
                                    onPressedChat: () {
                                      controller.showOrHideChat();
                                    },
                                    text:
                                        'I am honored to be speaking to you all today. We are living in a time of great change and uncertainty, but I believe that we also have the power to make a positive impact in our communities and in the world As we navigate these challenging times, it is important that we come together and support one another. We must listen to each other s perspectives and work towards understanding and finding common ground',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 3.h,
                      left: 9.w,
                      right: 9.w,
                      child: Row(
                        children: [
                          CustomButtonForEventDetails(
                              type: 1,
                              text: 'Accept invite',
                              onPressed: () {
                                controller.acceptOrReject(1, context);
                              }),
                          SizedBox(
                            width: 2.w,
                          ),
                          CustomButtonForEventDetails(
                              type: 2,
                              text: 'Reject invite',
                              onPressed: () {
                                controller.acceptOrReject(2, context);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              )));
    });
  }
}
