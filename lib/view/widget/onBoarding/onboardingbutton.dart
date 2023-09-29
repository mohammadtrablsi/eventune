import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class onboardingbutton extends StatelessWidget {
  const onboardingbutton(
      {super.key,
      required this.text,
      this.transport,
      this.go_to_register,
      this.skip,
      required this.index});
  final String text;
  final void Function()? transport;
  final void Function()? go_to_register;
  final void Function()? skip;
  final index;

  @override
  Widget build(BuildContext context) {
    return index == 2
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical: 4.w),
              splashColor: const Color.fromRGBO(124, 79, 228, 1),
              color: const Color.fromRGBO(126, 79, 239, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: go_to_register,
              child: Container(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    '1006'.tr,
                    style: TextStyle(fontSize: 13.sp, color: Colors.white),
                  ))),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                MaterialButton(
                  elevation: 5.0,
                  splashColor: const Color.fromRGBO(124, 79, 228, 1),
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.w, vertical: 4.w),
                  color: const Color.fromRGBO(126, 79, 239, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: skip,
                  child: Text(
                    '1005'.tr,
                    style: TextStyle(fontSize: 13.sp, color: Colors.white),
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  elevation: 5.0,
                  splashColor: const Color.fromRGBO(124, 79, 228, 1),
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.3.w),
                  color: const Color.fromRGBO(126, 79, 239, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: transport,
                  child: Row(
                    children: [
                      Text(
                        '1004'.tr,
                        style: TextStyle(fontSize: 13.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
