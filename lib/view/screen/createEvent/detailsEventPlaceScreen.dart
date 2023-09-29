import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/createEvent/detailsEventPlaceController.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/createEvent/customCaroselSlider.dart';
import '../../widget/createEvent/listDataForPlace.dart';
class DetailsEventPlaceScreen extends StatelessWidget {
  const DetailsEventPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsEventPlaceController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon:  Icon(Icons.arrow_back,
                    size: 20.sp, color: Colors.black)),
             Text(
              'Create event',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<DetailsEventPlaceController>(builder: (controller) {
        return Column(
          children: [
          CustomCaroselSlider(
            images: controller.image,
            initpage: controller.initpage,
            carouselController: controller.carouselController,
            onPressedNext: () {
              controller.nextCarousel();
            },
            onPressedPrevious: () {
              controller.previousCarousel();
            },
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(right: 6.w, left: 6.w, bottom: 4.h),
              child: Column(
                children: [
                  const ListDataForPlace(
                      describtion:
                          'lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap lap ',
                      location: 'Syria-Damascus-jeserAlraees',
                      cost: '200',
                      maxNumber: '200'),
                  CustomButtonForCreatEvent(
                    text: 'Continue',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ]);
      }),
    );
  }
}
