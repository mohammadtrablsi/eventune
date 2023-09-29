import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/color.dart';
import '../../../controller/venue/pendingController.dart';
import '../../widget/venue/itemOfPending.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Scaffold(
      body: GetBuilder<PendingController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsetsDirectional.only(start: 2.h, end: 2.h),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: controller.scrollController,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= controller.length) {
                    return  Center(
                      child: CircularProgressIndicator(
                          color: AppColor.primaryColor),
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        controller.insidedata[index].requests!.isNotEmpty
                            ? Text("${controller.insidedata[index].name?.name}")
                            : Container(),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount:
                                controller.insidedata[index].requests?.length,
                            itemBuilder: (BuildContext context, int indexo) =>
                                ItemOfPending(
                                  text1:
                                      '${controller.insidedata[index].requests?[indexo].name}',
                                  text3:
                                      '${controller.insidedata[index].requests?[indexo].privacy}',
                                  text4:
                                      '${controller.insidedata[index].requests?[indexo].capacity}',
                                  text5:
                                      '${controller.insidedata[index].requests?[indexo].endTime}',
                                  text6:
                                      '${controller.insidedata[index].requests?[indexo].date}  in ${controller.insidedata[index].requests?[indexo].startTime}',
                                  text7:
                                      '${controller.insidedata[index].requests?[indexo].pivot?.level?.level}',
                                  text8:
                                      '${controller.insidedata[index].requests?[indexo].pivot?.level?.price}',
                                  acceptPressed: () {
                                    controller.replay(
                                        controller.insidedata[index]
                                            .requests![indexo].id,
                                        "accept",
                                        index,
                                        indexo,
                                        true);
                                    Get.back();
                                  },
                                  rejectpressed: () {
                                    controller.replay(
                                        controller.insidedata[index]
                                            .requests![indexo].id,
                                        "reject",
                                        index,
                                        indexo,
                                        false);
                                    Get.back();
                                  },
                                  text9:
                                      '${controller.insidedata[index].requests?[indexo].description}',
                                  textcontroller:
                                      controller.rejectTextController,
                                )),
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
        },
      ),
    );
  }
}
