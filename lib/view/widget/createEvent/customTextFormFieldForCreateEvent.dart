import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomTextFormFieldForCreateEvent extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;
  const CustomTextFormFieldForCreateEvent({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 6.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(3.5.h), top: Radius.circular(2.h)),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 1), color: Colors.black26, blurRadius: 1.2)
        ],
      ),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        validator: validator,
        style: TextStyle(fontSize: 15.sp),
        cursorHeight: 3.h,
        decoration: InputDecoration(
          hintText: text,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 3.5.w,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
