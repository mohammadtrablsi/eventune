import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/auth/verifyCodeController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeController());
    return Scaffold(
      ///////////////////////////put
      appBar: AppBar(
        elevation: 0,
        title: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<VerifyCodeController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                Image.asset(
                  AppImageAsset.logo,
                  height: 11.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Welcome to EvenTune",
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 6.5.h,
                ),
                Text(
                  "Plaese Enter the 5 Diget Code Send To\n${controller.email.toString()}",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 6.5.h,
                ),
                OtpTextField(
                  autoFocus: true,
                  fieldWidth: 12.w,
                  textStyle: TextStyle(fontSize: 15.sp),
                  borderRadius: BorderRadius.circular(2.w),
                  numberOfFields: 5,
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    controller.code.text = verificationCode.toString();
                    controller.verify();
                  },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w),
                      child: TextButton(
                          onPressed: () {
                            controller.resendVerify();
                          },
                          child: Text(
                            "resend verify code",
                            style: TextStyle(
                                color: AppColor.primaryColor, fontSize: 13.sp),
                          )),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: CustomAuthButton(
                //           text: 'Verify',
                //           onPressed: () {
                //             controller.verify();
                //           }),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
