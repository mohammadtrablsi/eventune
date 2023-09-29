import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/class/handlingdataview.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/store/addProductController.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/store/cardForAddProduct.dart';
import '../../widget/venue/customButtomAddNewTime.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
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
              'Add Product',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<AddProductController>(builder: (controller) {
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
                              return CardForAddProduct(
                                animation: animation,
                                descriptionController:
                                    controller.textEditingController[index][2],
                                initiallyExpanded: controller.isExpanded[index],
                                length: controller.length,
                                nameController:
                                    controller.textEditingController[index][1],
                                priceController:
                                    controller.textEditingController[index][0],
                                numProduct: index,
                                product: controller.products,
                                onExpansionChanged: (bool val) {
                                  controller.isExpanded[index] = val;
                                },
                                onPressedPickImage: () {
                                  controller.pickMultiImage(index);
                                },
                                onDismissed: (d) {
                                  if (d == DismissDirection.endToStart ||
                                      d == DismissDirection.startToEnd) {
                                    controller.removeProduct(index, context);
                                  }
                                },
                              );
                            }))),
                        SizedBox(height: 3.h),
                        controller.length <= 19
                            ? CustomButtomAddNewTime(onPressed: () {
                                controller.addProduct();
                              })
                            : const SizedBox(),
                        SizedBox(
                          height: 8.h,
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
