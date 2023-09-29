import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/venue/AcceptController.dart';
import '../../../controller/venue/appTapController.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/appBarcustom.dart';

class AppTab extends StatelessWidget {
  const AppTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppTapController());
    return GetBuilder<AppTapController>(
      builder: (controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              body: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 2.5.h),
                child: const AppbarCustom(
                  text: 'Owner App',
                ),
              ),
              SizedBox(
                height: 1.5.h,
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
                      Get.delete<AcceptController>(force: true);
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
