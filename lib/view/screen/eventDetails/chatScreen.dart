import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../controller/detailsEvent/chatController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

import '../../widget/eventDetails/textFieldOfChat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());

    return GetBuilder<ChatController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.iconColor,
              )),
          title: Text(
            'Comments event ${controller.name}',
            style: TextStyle(
                fontSize: 17.sp,
                color: AppColor.iconColor,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 0.h,
              ),
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      // reverse: true,
                      padding: EdgeInsetsDirectional.only(bottom: 1.w),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= controller.length) {
                          return Center(
                            child: CircularProgressIndicator(
                                color: AppColor.primaryColor),
                          );
                        } else {
                          return Column(
                            children: [
                              // AMessage(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      transform: Matrix4.translationValues(
                                          0.0, 2.5.h, 0.0),
                                      width: 10.0.w,
                                      height: 10.0.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.primaryColor,
                                      ),
                                      child: Center(
                                          child: Text(
                                        (controller.insidedata[index] is String)
                                            ? "${controller.myServices.sharedPreferences.getString('name')?[0]}"
                                            : "${controller.insidedata[index].name?[0]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp),
                                      )),
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Material(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30),
                                                  ),
                                                  elevation: 5,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                    child: Container(
                                                      // width: 40.w,
                                                      // constraints: BoxConstraints(maxWidth: 30.w),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              (controller.insidedata[
                                                                          index]
                                                                      is String)
                                                                  ? "${controller.myServices.sharedPreferences.getString('name')}"
                                                                  : '${controller.insidedata[index].name}',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    11.5.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black54,
                                                              )),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .only(
                                                                        bottom:
                                                                            0.8.w),
                                                            child: Text(
                                                              (controller.insidedata[
                                                                          index]
                                                                      is String)
                                                                  ? '${controller.insidedata[index]}'
                                                                  : '${controller.insidedata[index].pivot?.comment}          ',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    11.5.sp,
                                                                color: Colors
                                                                    .black45,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        end: 4.w,
                                                        bottom: 0.9.w),
                                                child: Text(
                                                  (controller.insidedata[index]
                                                          is String)
                                                      ? "now"
                                                      : timeago.format(
                                                                  DateTime.parse(
                                                                      '${controller.insidedata[index].pivot?.createdAt}'),
                                                                  locale:
                                                                      'en_short') ==
                                                              'now'
                                                          ? '${timeago.format(DateTime.parse('${controller.insidedata[index].pivot?.createdAt}'), locale: 'en_short')} '
                                                          : '${timeago.format(DateTime.parse('${controller.insidedata[index].pivot?.createdAt}'), locale: 'en_short')} ago',
                                                  style: TextStyle(
                                                    fontSize: 9.sp,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                      },
                      itemCount: controller.isloadmore == true
                          ? controller.length + 1
                          : controller.length,
                    ),
                  ),
                ),
              ),
              TextFieldOfChat(
                controlle: controller.makeCommentTextController,
                onpressed: () {
                  controller.makeComment();
                  controller.scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
