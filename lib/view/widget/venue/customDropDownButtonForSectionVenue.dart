import 'package:flutter/material.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:Eventune/core/constant/color.dart';

import 'package:sizer/sizer.dart';

class CustomDropDownButtonForSectionVenue extends StatelessWidget {
  final List listData;
  final void Function(List<dynamic>) onChanged;
  final List initiallySelected;
  const CustomDropDownButtonForSectionVenue({
    super.key,
    required this.listData,
    required this.onChanged,
    required this.initiallySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 6.5.h,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(3.5.h), top: Radius.circular(2.h)),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 1), color: Colors.black26, blurRadius: 1.2)
        ],
      ),
      child: MultiSelectDropdown(
        boxDecoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
        includeSearch: true,
        list: listData,
        initiallySelected: initiallySelected,
        checkboxFillColor: AppColor.primaryColor,
        onChange: onChanged,
        numberOfItemsLabelToShow: 5,
        whenEmpty: 'Choose your cateigoryes from the list',
      ),
    );
  }
}
