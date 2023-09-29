import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/controller/auth/signupController.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/widget/auth/customAuthButton.dart';
import 'package:Eventune/view/widget/auth/customTextFormField.dart';
import 'package:Eventune/view/widget/auth/moveToSignupOrLogin.dart';
import 'package:sizer/sizer.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/validinput.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.5.h),
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
                    "1".tr,
                    style:
                        TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold,color: AppColor.iconColor),
                    textAlign: TextAlign.center,
                  ),
                  AppColor.isDark==true?SizedBox(
                    height: 4.5.h,
                  ):SizedBox(
                    height: 6.5.h,
                  ),
                  CustomTextFormField(
                      validator: (val) {
                        return vaildator(val!, 5, 25, 'name');
                      },
                      controller: controller.username!,
                      icon: Icons.person_2_outlined,
                      text: '9'.tr),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  CustomTextFormField(
                      validator: (val) {
                        return vaildator(val!, 5, 25, 'email');
                      },
                      controller: controller.email!,
                      icon: Icons.email_outlined,
                      text: '2'.tr),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  CustomTextFormField(
                      obscureText: controller.isPassword,
                      validator: (val) {
                        return vaildator(val!, 5, 15, 'password');
                      },
                      onTap: () {
                        controller.revPassword();
                      },
                      controller: controller.password!,
                      icon: controller.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      text: '3'.tr),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  MoveToSignupOrLogin(
                      text: '6'.tr,
                      onTap: () {
                        controller.goToLogin();
                      }),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  CustomAuthButton(
                      text: '7'.tr,
                      onPressed: () {
                        controller.signup();
                      }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
