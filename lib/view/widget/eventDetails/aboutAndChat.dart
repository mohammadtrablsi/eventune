import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class AboutEventAndChat extends StatelessWidget {
  final void Function()? onPressedChat;
  final String text;
  const AboutEventAndChat({super.key, this.onPressedChat, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About Event',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.iconColor),
              ),
              IconButton(
                  onPressed: onPressedChat,
                  icon: FaIcon(
                    FontAwesomeIcons.comment,
                    color: AppColor.primaryColor,
                    size: 23.sp,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        ReadMoreText(
          text,
          trimLines: 4,
          style:  TextStyle(
              fontSize: 18, height: 1.5, color: AppColor.iconColor),
          colorClickableText: AppColor.primaryColor,
          trimMode: TrimMode.Line,
          trimCollapsedText: '...Read more',
          trimExpandedText: ' Less',
        ),
      ],
    );
  }
}
