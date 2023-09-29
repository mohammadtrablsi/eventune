import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool? obscureText;
  final void Function()? onTap;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.icon,
      required this.controller,
      this.validator,
      this.onTap,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 13.5.sp,
            color: AppColor.isDark == true ? Colors.white54 : Colors.black38,
          ),
        ),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          obscureText: obscureText == null ? false : obscureText!,
          cursorHeight: 3.5.h,
          validator: validator,
          style: TextStyle(fontSize: 15.sp, color: AppColor.iconColor),
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.primaryColor, width: 1.5)),
             
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.iconColor, width: 0.7)),
              suffixIcon: InkWell(
                  onTap: onTap,
                  child: Icon(
                    icon,
                    size: 19.sp,
                  )),
              focusColor: AppColor.primaryColor,
              suffixIconColor: AppColor.primaryColor,
              contentPadding: const EdgeInsets.only(top: 20),
              isDense: true),
        ),
      ],
    );
  }
}
