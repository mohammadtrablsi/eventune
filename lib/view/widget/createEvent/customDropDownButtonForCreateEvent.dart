import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomDropDownButtonForCreateEvent extends StatelessWidget {
  final List listData;
  final String hintText;
  final void Function(Object?)? onChanged;
  final isSelected;
  const CustomDropDownButtonForCreateEvent({
    super.key,
    required this.listData,
    required this.hintText,
    this.isSelected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 6.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(3.5.h), top: Radius.circular(2.h)),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 1), color: Colors.black26, blurRadius: 1.2)
        ],
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(12),
          iconSize: 33,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              hintText,
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          isExpanded: true,
          value: isSelected,
          items: listData
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        e,
                        style:  TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ))
              .toList(),
          onChanged: onChanged),
    );
  }
}
