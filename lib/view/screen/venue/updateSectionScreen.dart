import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/venue/updateSectionController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/venue/cardUpdateWidget.dart';

class UpdateSectionScreen extends StatelessWidget {
  const UpdateSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateSectionController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon:
                Icon(Icons.arrow_back, size: 20.sp, color: AppColor.iconColor)),
        title: Text(
          'Edite Section',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<UpdateSectionController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CardUpdateSection(
                  descriptionController: controller.descriptionController!,
                  priceAverageController:
                      controller.textEditingControllerForCateigory[controller
                          .selectCateigory[controller.indexSelect!]['id']]![0],
                  priceFancyController:
                      controller.textEditingControllerForCateigory[controller
                          .selectCateigory[controller.indexSelect!]['id']]![1],
                  priceLuxuryController:
                      controller.textEditingControllerForCateigory[controller
                          .selectCateigory[controller.indexSelect!]['id']]![2],
                  priceController: controller.priceController!,
                  numPersonController: controller.numPersonController!,
                  initiallySelectedForCateigory: controller.selectCateigory,
                  listofCateigory: controller.listCateigory,
                  onChangedNewList: (newList) {
                    controller.addToListOfCateigory(newList);
                  },
                  onPressedPickImage: () {
                    controller.pickMultiImage();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 3.h, left: 5.w, right: 5.w, top: 2.h),
                  child: CustomButtonForCreatEvent(
                      text: 'Update Data',
                      onPressed: () {
                        controller.next();
                      }),
                ),
              ],
            ));
      }),
    );
  }
}
