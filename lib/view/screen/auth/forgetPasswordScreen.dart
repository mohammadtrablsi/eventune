import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/auth/forgetPasswordController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customAuthButton.dart';
import '../../widget/auth/customTextFormField.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(ForgetPasswordController());
    return Scaffold(
      ///////////////////////////////put
      appBar: AppBar(
        elevation: 0,
        title: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<ForgetPasswordController>(builder: (controller) {
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
                  "Plaese Enter Youe Email Address To\nRecive A Verification Code",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 6.5.h,
                ),
                CustomTextFormField(
                    validator: (val) {
                      return vaildator(val!, 8, 50, 'email');
                    },
                    controller: controller.emailController,
                    icon: Icons.email_outlined,
                    text: 'Email'),
                SizedBox(
                  height: 15.h,
                ),
                CustomAuthButton(
                    text: 'Send',
                    onPressed: () {
                      controller.send();
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
