import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../linkapi.dart';
import '../../../controller/myTicket/registeredEventsDetailsController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/homepage/imageInEventDetails.dart';



class registeredEventsDetails extends StatelessWidget {
  const registeredEventsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(registeredEventsDetailsController());
    return Scaffold(
      body: GetBuilder<registeredEventsDetailsController>(
        builder: (controller) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const AppbarCustom(
                    text: 'Registered Event Details',
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ImageInEventDetails(
                          image:controller.datalist['photos'].isEmpty?AppImageAsset.nophoto:"${AppLink.imageLink}${controller.datalist['photos'][controller.i]['path']}", i: controller.i, ontap1: () { controller.buttonforimages("left"); }, ontap2: () { controller.buttonforimages("right"); },
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                              top: 2.h, bottom: 6.h, start: 2.5.h, end: 1.h),
                          width: double.infinity,
                          decoration:BoxDecoration(
                              borderRadius:const BorderRadius.only(
                                bottomLeft: Radius.circular(75),
                                bottomRight: Radius.circular(75),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset:
                                  const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                children:  [
                                  Text(
                                    "Event's name : ",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp),
                                  ),
                                  Text("${controller.datalist['name']}",
                                    style: TextStyle(fontSize: 10.5.sp),),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              controller.isMyEvent?Column(
                                children: [
                                  Row(
                                    children:  [
                                      Text("privacy : ",
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                      Text(" ${controller.datalist['privacy']}",style: TextStyle(fontSize: 10.5.sp,color: AppColor.primaryColor),),
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                ],
                              ):Row(
                                children:  [
                                  Text(
                                    'create by : ',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp),
                                  ),
                                  Text("${controller.datalist['user']['name']}",
                                    style: TextStyle(fontSize: 10.5.sp),),
                                ],
                              ),
                              controller.isMyEvent?Container(): SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children:  [
                                  Text('capacity : ',
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                  Text(controller.datalist['section_id']!=null?"${controller.datalist['capacity']}":"${controller.datalist['capacity']['capacity']}",
                                    style: TextStyle(fontSize: 10.5.sp),),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children:  [
                                  Text('rest capacity : ',
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                  Text("${controller.datalist['rest_capacity']}",
                                    style: TextStyle(fontSize: 10.5.sp),),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children:  [
                                  Text('ticket price : ',
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                  Text(controller.datalist['ticket'] !=
                                      null
                                      ? "${controller
                                      .datalist['ticket']['price']}\$"
                                      : "free",
                                    style: TextStyle(fontSize: 10.5.sp),),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text('1074'.tr,
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                  Text(
                                    "${controller.datalist['date'] } in ${controller.datalist['start_time']} to ${controller.datalist['end_time']}",
                                    style: TextStyle(fontSize: 10.5.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            
                              controller.isMyEvent?Container(): Row(
                                children:  [
                                  Text("Event's Location".tr,
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                  Text(controller.datalist['section_id']==null?"${controller.datalist['longitude']} ${controller.datalist['latitude']}":"${controller.datalist['section']['venue']['latitude']} ${controller.datalist['section']['venue']['longitude']}",style: TextStyle(fontSize: 10.5.sp),),
                                ],
                              ),
                              controller.isMyEvent?Container(): controller.datalist['section_id']!=null? Column(children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children:  [
                                    Text('venue name : ',
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                    Text("${controller.datalist['section']['venue']['name']}",
                                      style: TextStyle(fontSize: 10.5.sp),),
                                  ],
                                ),
                              ],):Container(),
                              controller.isMyEvent?Container():SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('description : ',
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                ],
                              ),
                              SizedBox(height: 0.3.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${controller.datalist['description']}",
                                        style: TextStyle(fontSize: 10.5.sp),),
                                    ],),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
