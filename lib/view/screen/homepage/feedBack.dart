import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/homepage/feedBackController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/createEvent/appBarcustom.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    FeedBackController controller = Get.put(FeedBackController());
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 3.w),
              child: const AppbarCustom(text: 'Feed Back'),
            ),
            SizedBox(
              height: 4.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 96.w,
                height: 25.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppImageAsset.logo),
                    fit: BoxFit.cover,
                  ),
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              height: MediaQuery.of(context).size.height,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello ${controller.myServices.sharedPreferences.getString('name')} thank you for use our app give us your feed back about our app and thanks for you',
                    style: TextStyle(
                        height: 1.3,
                        fontSize: AppColor.isDark == true ? 13.5.sp : 15.sp,
                        color: AppColor.iconColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: AppColor.isDark == true ? 9.h : 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: TextFormField(
                      controller: controller.feedBackTextController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.feedback_outlined,
                          color: AppColor.primaryColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor),
                        ),
                        hintStyle: TextStyle(
                          color: AppColor.primaryColor,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 227, 219, 219),
                              width: 1.0),
                        ),
                        hintText: 'your feed back',
                      ),
                      cursorColor: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsetsDirectional.only(bottom: 4.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          elevation: 3.0,
                          splashColor: AppColor.primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 9.w, vertical: 2.w),
                          color: AppColor.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            controller.makeFeedBack();
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Text(
                                "Send",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Copyright',
                        style: TextStyle(
                          height: 1.8,
                          fontSize: AppColor.isDark == true ? 11.5.sp : 13.sp,
                          color: AppColor.iconColor,
                        ),
                      ),
                      Icon(
                        Icons.copyright_outlined,
                        size: 18.sp,
                        color: AppColor.iconColor,
                      ),
                      Text(
                        '2023 EvenTune All Right Reversed',
                        style: TextStyle(
                          height: 1.8,
                          fontSize: AppColor.isDark == true ? 11.5.sp : 13.sp,
                          color: AppColor.iconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
