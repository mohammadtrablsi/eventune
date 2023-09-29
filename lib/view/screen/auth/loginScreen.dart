import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/controller/auth/loginController.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/widget/auth/customAuthButton.dart';
import 'package:Eventune/view/widget/auth/customTextFormField.dart';
import 'package:Eventune/view/widget/auth/moveToSignupOrLogin.dart';
import 'package:sizer/sizer.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/moveToForgetPassword.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: alertExitApp,
            child: Padding(
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
                      '1'.tr,
                      style: TextStyle(
                          fontSize: 19.sp, fontWeight: FontWeight.bold,color: AppColor.iconColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 6.5.h,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        return vaildator(val!, 8, 25, 'email');
                      },
                      controller: controller.email!,
                      icon: Icons.email_outlined,
                      text: '2'.tr,
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    CustomTextFormField(
                      obscureText: controller.isPassword,
                      validator: (val) {
                        return vaildator(val!, 5, 15, 'password');
                      },
                      controller: controller.password!,
                      onTap: () {
                        controller.revPassword();
                      },
                      icon: controller.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      text: '3'.tr,
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MoveToForgetpassword(
                            text: '4'.tr,
                            onTap: () {
                              controller.goToForgetPassword();
                            }),
                        MoveToSignupOrLogin(
                            text: '7'.tr,
                            onTap: () {
                              controller.goToSignup();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    CustomAuthButton(
                        text: '6'.tr,
                        onPressed: () {
                          controller.login();
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
