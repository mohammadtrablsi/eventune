import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/color.dart';
import '../../../controller/venue/AcceptController.dart';
import '../../widget/venue/itemOfAccepted.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptController());
    return Scaffold(
      body: GetBuilder<AcceptController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsetsDirectional.only(start: 2.h, end: 2.h),
            child: ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                if (index >= controller.length) {
                  return  Center(
                    child:
                        CircularProgressIndicator(color: AppColor.primaryColor),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      controller.insidedata[index].events!.isNotEmpty
                          ? Text("${controller.insidedata[index].name?.name}")
                          : Container(),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.insidedata[index].events?.length,
                        itemBuilder: (BuildContext context, int indexo) =>
                            ItemOfAccepted(
                          text1:
                              '${controller.insidedata[index].events?[indexo].name}',
                          text2:
                              '${controller.insidedata[index].events?[indexo].user?.name}',
                          text3:
                              '${controller.insidedata[index].events?[indexo].privacy}',
                          text4:
                              '${controller.insidedata[index].events?[indexo].capacity}',
                          text5:
                              'from ${controller.insidedata[index].events?[indexo].startTime} to ${controller.insidedata[index].events?[indexo].endTime}',
                          text6:
                              '${controller.insidedata[index].events?[indexo].date} ',
                          text7:
                              '${controller.insidedata[index].events?[indexo].pivot?.level?.level}',
                          text8:
                              '${controller.insidedata[index].events?[indexo].ticket?.price}',
                          text9:
                              '${controller.insidedata[index].events?[indexo].description}',
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
        );
      }),
    );
  }
}
