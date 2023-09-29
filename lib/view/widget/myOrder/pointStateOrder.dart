import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class PointStateOrder extends StatelessWidget {
  final int? numberState;
  final String nameState;
  const PointStateOrder({super.key, this.numberState, required this.nameState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: numberState == 1
              ? AppColor.primaryColor
              : AppColor.isDark == true
                  ? Colors.white12
                  : Colors.black12,
          radius: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nameState,
          style:  TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.iconColor),
        ),
      ],
    );
  }
}
