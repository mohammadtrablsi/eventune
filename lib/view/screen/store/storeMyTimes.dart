import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/store/storeMyTimeController.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/store/itemOfTimeStore.dart';
import '../../widget/venue/itemOfAppTabOfTimevenu.dart';

class StoreMyTimes extends StatelessWidget {
  const StoreMyTimes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoreMyTimesController());
    return Scaffold(
      body: GetBuilder<StoreMyTimesController>(
        builder: (controller) {
          return Container(
              padding: EdgeInsetsDirectional.only(start: 3.h, end: 3.h),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 5.h,
                ),
                const AppbarCustom(
                  text: 'Times Store',
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
                  height: 5.h,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: ItemOfTimeStore(
                  nameOfList: controller.lists(),
                ))),
              ]));
        },
      ),
    );
  }
}
