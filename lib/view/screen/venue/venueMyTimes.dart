import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/venue/venueMyTimesController.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/venue/itemOfAppTabOfTimevenu.dart';
import '../../widget/venue/itemOfTimeVenueForUpdate.dart';

class VenueMyTimes extends StatelessWidget {
  const VenueMyTimes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VenueMyTimesController());
    return Scaffold(
      body: GetBuilder<VenueMyTimesController>(
        builder: (controller) {
          return Container(
              padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 1.h),
                      child: const AppbarCustom(
                        text: 'My Times',
                      ),
                    ),
                    const Spacer(),
                  
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                      7,
                      (index) => ItemOfAppTabOfTimevenu(
                        index: index,
                        text: controller.texts[index],
                        ontap: () {
                          controller.changeColor(index);
                          controller.getIndex(index);
                        },
                        colors: controller.colors,
                      ),
                    ))),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: ItemOfTimevenuForUpdate(
                  nameOfList: controller.lists(),
                ))),
                SizedBox(
                  height: 2.h,
                ),
              ]));
        },
      ),
    );
  }
}
