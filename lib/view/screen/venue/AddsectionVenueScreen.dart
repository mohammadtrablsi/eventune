import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/class/handlingdataview.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/venue/addSectonVenueController.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/venue/cardForSection.dart';
import '../../widget/venue/customButtomAddNewTime.dart';

class SectionVenueScreen extends StatelessWidget {
  const SectionVenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SectonVenueController());
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
              'Add Section',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColor.iconColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<SectonVenueController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: ListView(
                      children: [
                        AnimatedList(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            key: controller.key,
                            initialItemCount: controller.length,
                            itemBuilder: (((context, index, animation) {
                              return CardForSection(
                                onExpansionChanged: (bool val) {
                                  controller.isExpanded[index] = val;
                                },
                                initiallyExpanded: controller.isExpanded[index],
                                initiallySelected:
                                    controller.initialSelectCateigory[index],
                                length: controller.length,
                                onDismissed: (d) {
                                  if (d == DismissDirection.endToStart ||
                                      d == DismissDirection.startToEnd) {
                                    controller.removeSection(index, context);
                                  }
                                },
                                animation: animation,
                                listofCateigory: controller.listCateigory,
                                numPersonController:
                                    controller.textEditingController[index][0],
                                numSection: index + 1,
                                priceAverageController: controller
                                        .textEditingControllerForCateigory[
                                    index][controller.indexSelect[index]][0],
                                priceFancyController: controller
                                        .textEditingControllerForCateigory[
                                    index][controller.indexSelect[index]][1],
                                priceLuxuryController: controller
                                        .textEditingControllerForCateigory[
                                    index][controller.indexSelect[index]][2],
                                priceController:
                                    controller.textEditingController[index][1],
                                descriptionController:
                                    controller.textEditingController[index][2],
                                onChangedNewList: (newList) {
                                  controller.addToListOfCateigory(
                                      index, newList);
                                },
                                onPressedPickImage: () {
                                  controller.pickMultiImage(index);
                                },
                              );
                            }))),
                        SizedBox(height: 3.h),
                        controller.length <= 4
                            ? CustomButtomAddNewTime(onPressed: () {
                                controller.addSection();
                              })
                            : const SizedBox(),
                        SizedBox(
                          height: 9.h,
                        )
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 3.h, left: 5.w, right: 5.w),
                    child: CustomButtonForCreatEvent(
                        text: 'Next',
                        onPressed: () {
                          controller.handleList();
                          controller.next();
                        }),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
