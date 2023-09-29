import 'package:flutter/material.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

import 'package:sizer/sizer.dart';

class CustomDropDownButtonForProduct extends StatelessWidget {
  final List listData;
  final String hintText;
  final void Function(int?)? onChanged;
  const CustomDropDownButtonForProduct({
    super.key,
    required this.listData,
    required this.hintText,
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
        child: SearchableDropdown<int>(
          dropDownMaxHeight: 40.h,
          isDialogExpanded: false,
          hintText: Text(
            hintText,
            style: TextStyle(fontSize: 14.sp, color: Colors.black54),
          ),
          items: listData
              .map((e) => SearchableDropdownMenuItem<int>(
                  value: e['id'],
                  label: e['name'],
                  child: Text(
                    e['name'],
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  )))
              .toList(),
          onChanged: onChanged,
        ));
  }
}




//
// DropdownButton(
//           underline: const SizedBox(),
//           borderRadius: BorderRadius.circular(12),
//           iconSize: 33,
//           hint: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               hintText,
//               style: const TextStyle(fontSize: 20),
//             ),
//           ),
//           isExpanded: true,
//           value: isSelected,
//           items: listData
//               .map((e) => DropdownMenuItem(
//                     value: e['id'].toString(),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Text(
//                         e['name'].toString(),
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ))
//               .toList(),
//           onChanged: onChanged),