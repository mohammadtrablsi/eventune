import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomAuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 45,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          onPressed:onPressed,
          color:AppColor.primaryColor,
          child:
              Text(text, style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.white)),
        ),
      ),
    );
  }
}
