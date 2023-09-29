import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/myOrder/myOrderController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
import '../../widget/myOrder/cardOrder.dart';
import '../../widget/myOrder/rowText.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrderController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Order',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<MyOrderController>(builder: (controller) {
        return Padding(
          padding: EdgeInsetsDirectional.only(top: 0.h, start: 3.h, end: 3.h),
          child: Column(
            children: [
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.separated(
                    controller: controller.scrollController,
                    padding: EdgeInsetsDirectional.only(top: 2.w),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      if (index >= controller.length) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: AppColor.primaryColor),
                        );
                      } else {
                        return InkWell(
                              borderRadius: BorderRadius.circular(30),
                              child: CardOrder(
                                time:
                                    '${controller.insidedata[index].date} in ${controller.insidedata[index].time}',
                                storeName:
                                    '${controller.insidedata[index].store?.name}',
                                orderLocation: controller
                                        .insidedata[index].location!.isEmpty
                                    ? RowText(
                                        text1: 'location ',
                                        text2:(controller.insidedata[index].costumLocation?.longitude!=null&&controller.insidedata[index].costumLocation?.latitude!=null)?
                                            "${controller.insidedata[index].costumLocation?.longitude} ${controller.insidedata[index].costumLocation?.latitude}":'Not Determine',
                                      )
                                    : Column(
                                        children: [
                                          RowText(
                                              text1: "name of place ",
                                              text2:
                                                  "${controller.insidedata[index].location?[0].name}"),
                                          SizedBox(
                                            height: 1.5.h,
                                          ),
                                          RowText(
                                              text1: "location ",
                                              text2:
                                                  "${controller.insidedata[index].location?[0].longitude} ${controller.insidedata[index].location?[0].latitude}"),
                                        ],
                                      ),
                                phone:
                                    '${controller.insidedata[index].store?.phones?[0].phoneNumber}',
                                price: '${controller.insidedata[index].cost}',
                              ),
                              onTap: () {
                                Get.toNamed(
                                  AppRoute.detailsOrderScreen,
                                  arguments: [
                                    {
                                      'status':
                                          controller.insidedata[index].status,
                                      'dataList':
                                          controller.insidedata[index].products,
                                    }
                                  ],
                                );
                              },
                            );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 3.h,
                      );
                    },
                    itemCount: controller.isloadmore == true
                        ? controller.length + 1
                        : controller.length,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
