import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/createEvent/customButtonForCreateEvent.dart';
import 'package:Eventune/view/widget/createEvent/customTextFormFieldForCreateEvent.dart';
import 'package:sizer/sizer.dart';

class RowTextAndTextField extends StatelessWidget {
  final IconData icon;
  final String text;
  final String hintTextField;
  final TextEditingController controller;

  const RowTextAndTextField({super.key, required this.icon, required this.text, required this.hintTextField, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          flex: 3,
          child: CustomButtomForCreateEvent(
              icon: icon, text: text, onPressed: null),
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
          child: CustomTextFormFieldForCreateEvent(
              text: hintTextField, controller: controller),
        ),
      ],
    );
  }
}
