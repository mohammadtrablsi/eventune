import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/createEvent/customButtonForCreateEvent.dart';
import 'package:sizer/sizer.dart';

import 'CustomTextFormFieldForUpdateSection.dart';

class RowTextAndTextFieldForUpdate extends StatelessWidget {
  final IconData icon;
  final String text;
  final String hintTextField;
  final TextEditingController controller;
  final String? initialValue;

  const RowTextAndTextFieldForUpdate(
      {super.key,
      required this.icon,
      required this.text,
      required this.hintTextField,
      required this.controller, this.initialValue});

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
          child: CustomTextFormFieldForUpdateSection(
            text: hintTextField,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
