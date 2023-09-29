import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TextFieldOfChat extends StatelessWidget {
  const TextFieldOfChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 8.h,
            padding: EdgeInsetsDirectional.only(start: 3.h, end: 5.w),
            decoration: const BoxDecoration(),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: '1076'.tr,
                suffixIcon: const Icon(
                  Icons.forward,
                  color: Color.fromRGBO(124, 79, 228, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
