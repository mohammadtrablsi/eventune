import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/imgaeasset.dart';
import 'package:Eventune/view/widget/eventDetails/customButtonForEventDetalis.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/myOrder/stateOrderController.dart';
import '../../../core/middleware/middlewareForScreen.dart';
import '../homepage/bottomnav.dart';

class AddStoreOrVenueScreen extends StatelessWidget {
  const AddStoreOrVenueScreen({
    super.key,
  });

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
                icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
            Text(
              'Owner Acount',
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
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImageAsset.onboarding2), // Replace 'assets/onboarding2.jpg' with your image path
                      fit: BoxFit.cover, // You can adjust the fit as needed
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 6.w),
            //   child: Image.asset(AppImageAsset.onboarding2),
            // ),
            SizedBox(
              height: 7.h,
            ),
            CustomButtonForEventDetails(
              text: 'Add Store',
              onPressed: () {
                Get.offAll(storeMiddleWare());
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButtonForEventDetails(
              text: 'Add Venue',
              onPressed: () {
                Get.offAll(venueMiddleWare());
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
