import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/class/handlingdataview.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/createEvent/imagesAndPaidController.dart';
import '../../widget/createEvent/customButtonForCreateEvent.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/createEvent/customDropDownButtonForCreateEvent.dart';
import '../../widget/createEvent/rowTextAndTextField.dart';

class ImagesAndPaidScreen extends StatelessWidget {
  const ImagesAndPaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImagesAndPaidController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
            Text(
              '1040'.tr,
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<ImagesAndPaidController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: ListView(
                children: [
                  Text(
                    '1032'.tr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomButtomForCreateEvent(
                            icon: FontAwesomeIcons.fileImage,
                            text: '1033'.tr,
                            onPressed: () {
                              controller.pickMultiImage();
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        controller.mapData['privacy'] != 'private'
                            ? CustomDropDownButtonForCreateEvent(
                                hintText: '${'1036'.tr}/${'1035'.tr}',
                                listData: const ['Paid', 'Free'],
                                isSelected: controller.isSelected,
                                onChanged: (val) {
                                  controller.selectFreeOrPaid(val);
                                })
                            : const SizedBox(),
                        controller.isFree
                            ? const SizedBox()
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  RowTextAndTextField(
                                    controller: controller.priceTicket!,
                                    hintTextField: '200\$',
                                    icon: FontAwesomeIcons.dollarSign,
                                    text: 'Price ticket',
                                  ),
                                ],
                              ),
                        controller.mapData['privacy'] != 'private'
                            ? SizedBox(
                                height: controller.isFree ? 11.5.h : 4.h,
                              )
                            : SizedBox(
                                height: 3.h,
                              ),
                        CustomButtonForCreatEvent(
                            text: 'Next',
                            onPressed: () {
                              controller.next();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
