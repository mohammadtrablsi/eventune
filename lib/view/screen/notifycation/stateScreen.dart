import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/core/constant/imgaeasset.dart';
import 'package:Eventune/view/widget/eventDetails/customButtonForEventDetalis.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/myOrder/stateOrderController.dart';
import '../../widget/myOrder/rowState.dart';
import '../homepage/bottomnav.dart';

class StateScreen extends StatelessWidget {
  final int numState;
  const StateScreen({super.key, required this.numState});

  @override
  Widget build(BuildContext context) {
    Get.put(StateOrderController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(const bottomnav());
                },
                icon: Icon(Icons.arrow_back, size: 20.sp, color: AppColor.iconColor)),
            Text(
              'State order',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<StateOrderController>(builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: RowState(
                numState: numState,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Image.asset(numState == 1
                  ? AppImageAsset.onboarding2
                  : numState == 2
                      ? AppImageAsset.onboarding3
                      : AppImageAsset.nodata),
            ),
            SizedBox(
              height: 6.h,
            ),
            CustomButtonForEventDetails(
              text: 'Go To HomePage',
              onPressed: () {
                Get.offAll(const bottomnav());
              },
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        );
      }),
    );
  }
}
