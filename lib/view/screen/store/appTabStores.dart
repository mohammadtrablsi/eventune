import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/store/appTapStoresController.dart';
import '../../../controller/store/storesAcceptController.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/appBarcustom.dart';

class AppTabStores extends StatelessWidget {
  const AppTabStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppTapStoresController());
    return GetBuilder<AppTapStoresController>(
      builder: (controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              body: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 2.5.h),
                child: const AppbarCustom(
                  text: 'Stores Section',
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 10.h,
                decoration:  BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.primaryColor,
                      width: 3.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: TabBar(
                  onTap: (int index) {
                    if (index == 2) {
                      Get.delete<StoresAcceptController>(force: true);
                    }
                  },
                  indicator:  BoxDecoration(
                    color: AppColor.primaryColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: controller.taps,
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: controller.pages,
              ))
            ],
          )),
        );
      },
    );
  }
}
