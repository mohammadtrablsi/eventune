import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CustomAppBarEventDetalis extends StatelessWidget {
  final void Function()? onPressedShare;
  final void Function()? onPressedBack;
  final int numPage;
  const CustomAppBarEventDetalis(
      {super.key,
      this.onPressedShare,
      this.onPressedBack,
      required this.numPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: onPressedBack,
                  icon: Icon(Icons.arrow_back,
                      size: 21.sp,
                      color: numPage == 1 ? Colors.white : AppColor.iconColor)),
              Text(
                'EventDetails',
                style: TextStyle(
                    fontSize: 17.sp,
                    color: numPage == 1 ? Colors.white : AppColor.iconColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          numPage == 1
              ? Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: onPressedShare,
                      icon: const Icon(Icons.share, color: Colors.white)))
              : const SizedBox()
        ],
      ),
    );
  }
}
