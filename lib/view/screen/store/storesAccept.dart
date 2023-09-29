import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/store/ItemOfAcceptStore.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/store/storesAcceptController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/selectPosition.dart';

class StoresAccept extends StatelessWidget {
  const StoresAccept({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoresAcceptController());
    return Scaffold(
      body: GetBuilder<StoresAcceptController>(builder: (controller) {
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
                  return ItemOfAcceptedStore(
                    text1:
                        '${controller.insidedata[index].date} in  ${controller.insidedata[index].time}',
                    text2: '${controller.insidedata[index].user?.name}',
                    location: controller.insidedata[index].location!.isEmpty
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "location: ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FutureBuilder<String>(
                                    future: getAddress(52.2165157, 6.9437819),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        return Expanded(
                                          child: Text(
                                            '${snapshot.data}',
                                            style: TextStyle(fontSize: 14.sp),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  // Text(
                                  //   "${controller.insidedata[index].costumLocation?.longitude} ${controller.insidedata[index].costumLocation?.latitude}",
                                  //   style: TextStyle(fontSize: 14.sp),
                                  // )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 0.3,
                                width: 100.w,
                                color: AppColor.primaryColor,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "name of place: ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${controller.insidedata[index].location?[0].name}",
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "location: ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FutureBuilder<String>(
                                    future: getAddress(52.2165157, 6.9437819),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        return Expanded(
                                          child: Text(
                                            '${snapshot.data}',
                                            style: TextStyle(fontSize: 14.sp),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  // Text(
                                  //   "${controller.insidedata[index].location?[0].longitude} ${controller.insidedata[index].location?[0].latitude}",
                                  //   style: TextStyle(fontSize: 14.sp),
                                  // )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 0.3,
                                width: 100.w,
                                color: AppColor.primaryColor,
                              ),
                            ],
                          ),
                    products: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount:
                            controller.insidedata[index].products?.length,
                        itemBuilder: (BuildContext context, int indexo) {
                          return Column(
                            children: [
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              Row(
                                children: [
                                  Text(
                                    "products  ${indexo + 1}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "name: ",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  Text(
                                    "${controller.insidedata[index].products?[indexo].product!.name}",
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "quantity: ",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  Text(
                                    "${controller.insidedata[index].products?[indexo].pivot?.quantity}",
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "price: ",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  Text(
                                    "${controller.insidedata[index].products?[indexo].price}",
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                                ],
                              ),
                            ],
                          );
                        }),
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
