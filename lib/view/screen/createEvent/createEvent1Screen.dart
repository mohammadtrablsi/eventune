import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/core/functions/validinput.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/createEvent/createEvent1Controller.dart';
import '../../../core/class/handlingdataview.dart';

import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/store/customDropDownButtonForStore.dart';
import '../../widget/venue/customTextFormFieldForCreateVenueOrStore.dart';

class CreateEvent1Screen extends StatelessWidget {
  const CreateEvent1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateEvent1Controller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(const bottomnav());
                },
                icon: Icon(Icons.arrow_back,
                    size: 20.sp, color: AppColor.iconColor)),
            Text(
              '1040'.tr,
              style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColor.iconColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<CreateEvent1Controller>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: ListView(
                    children: [
                      Text(
                        "1002".tr,
                        style: TextStyle(
                            height: 0.3.h,
                            fontSize: 15.sp,
                            color: AppColor.iconColor,
                            fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      Form(
                        key: controller.formstate,
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomDropDownButtonForProduct(
                                hintText: (controller.selected == null)
                                    ? '1026'.tr
                                    : controller
                                        .selectedCategory[controller.selected],
                                listData: controller.categorys,
                                onChanged: (val) {
                                  controller.selectData(val);
                                },
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomTextFormFieldForCreateVenueOrStore(
                                  validator: (val) {
                                    return vaildator(val!, 3, 50, 'else');
                                  },
                                  text: '1043'.tr,
                                  controller: controller.nameEvent),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomTextFormFieldForCreateVenueOrStore(
                                  validator: (val) {
                                    return vaildator(val!, 1, 10, 'else');
                                  },
                                  text: '1045'.tr,
                                  controller: controller.capacityEvent),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomTextFormFieldForCreateVenueOrStore(
                                  validator: (val) {
                                    return vaildator(val!, 3, 150, 'else');
                                  },
                                  text: '1044'.tr,
                                  controller: controller.description,
                                  isExpanded: true),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomButtonForCreatEvent(
                                  text: '1004'.tr,
                                  onPressed: () {
                                    controller.next();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
