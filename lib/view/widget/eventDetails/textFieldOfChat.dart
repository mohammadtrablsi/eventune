import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class TextFieldOfChat extends StatelessWidget {
  const TextFieldOfChat(
      {super.key, required this.controlle, required this.onpressed});
  final controlle;
  final void Function()? onpressed;

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
            child: TextFormField(
              controller: controlle,
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(top: 1.5.h,left:3.w),
                hintText: 'write a comment about event',
                suffixIcon: IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    Icons.send,
                    color: AppColor.primaryColor,
                  ),
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
