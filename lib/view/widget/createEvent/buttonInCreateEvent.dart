import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';

class ButtonInCreateEvent extends StatelessWidget {
  const ButtonInCreateEvent(
      {super.key,
      required this.widget,
      required this.onpressed,
      required this.radius,required this.paddinghorizontal,required this.paddingvertical});
  final Widget widget;
  final void Function()? onpressed;
  final radius;
  final paddinghorizontal ;
  final paddingvertical ;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            elevation: 5.0,
            splashColor:AppColor.primaryColor,
            padding: EdgeInsets.symmetric(horizontal:paddinghorizontal, vertical: paddingvertical),
            color:AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
            onPressed: onpressed,
            child: Row(
              children: [
                widget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
