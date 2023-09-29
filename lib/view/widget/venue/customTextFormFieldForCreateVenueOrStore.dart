import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomTextFormFieldForCreateVenueOrStore extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;
  final bool? isExpanded;
  const CustomTextFormFieldForCreateVenueOrStore({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
    this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: isExpanded != null ? 20.h : 6.5.h,
      width: 100.w,
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
        maxLines: isExpanded != null ? null : 1,
        minLines: null,
        expands: isExpanded != null ? true : false,
        controller: controller,
        validator: validator,
        style: TextStyle(fontSize: 15.sp),
        cursorHeight: 3.h,
        decoration: InputDecoration(
          isDense: true,
          hintText: text,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.5.h),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
