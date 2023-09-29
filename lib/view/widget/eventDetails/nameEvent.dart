import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
class NameEvent extends StatelessWidget {
  final String text;
  const NameEvent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColor.iconColor
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}
