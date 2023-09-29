import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/auth/resetpasswordController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customAuthButton.dart';
import '../../widget/auth/customTextFormField.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      /////////////////put
      appBar: AppBar(
        elevation: 0,
        title: IconButton(
            onPressed: () {
              Get.offAll(const LoginScreen());
            },
            icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<ResetPasswordController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
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
                  "Your New Password Must Be Differnt\nFrom Previously Used Password",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 6.5.h,
                ),
                CustomTextFormField(
                    obscureText: controller.isPassword1,
                    validator: (val) {
                      return vaildator(val!, 5, 15, 'password');
                    },
                    controller: controller.password!,
                    onTap: () {
                      controller.revPassword1();
                    },
                    icon: controller.isPassword1
                        ? Icons.visibility
                        : Icons.visibility_off,
                    text: 'Password'),
                SizedBox(
                  height: 3.5.h,
                ),
                CustomTextFormField(
                    obscureText: controller.isPassword2,
                    validator: (val) {
                      return vaildator(val!, 5, 15, 'password');
                    },
                    controller: controller.rePassword!,
                    onTap: () {
                      controller.revPassword2();
                    },
                    icon: controller.isPassword2
                        ? Icons.visibility
                        : Icons.visibility_off,
                    text: 'Confirm Password'),
                SizedBox(
                  height: 6.5.h,
                ),
                CustomAuthButton(
                    text: 'Save',
                    onPressed: () {
                      controller.save();
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
