import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:Eventune/view/widget/auth/customAuthButton.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constant/imgaeasset.dart';
import '../eventDetails/customButtonForEventDetalis.dart';

class DetailsVenueOrStoreScreen extends StatelessWidget {
  const DetailsVenueOrStoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppImageAsset.eventDetails, fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'The request is being processed,\n you will receive a notification of the result',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: CustomAuthButton(
                        text: 'Go To Home Page',
                        onPressed: () {
                          Get.offAll(const bottomnav());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
