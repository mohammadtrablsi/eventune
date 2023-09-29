import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'customInkwellForCart.dart';

class RowQuantityAndDelete extends StatelessWidget {
  final void Function()? onTapDelete;
  final void Function()? onTapIncrease;
  final void Function()? onTapDecrease;
  final String quantity;

  const RowQuantityAndDelete({super.key, this.onTapDelete, this.onTapIncrease, this.onTapDecrease, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInkwellForCart(
                icon: FontAwesomeIcons.chevronUp,
                colorBorder: Colors.black38,
                colorIcon: Colors.black38,
                onTap: onTapIncrease,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  quantity,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CustomInkwellForCart(
                icon: FontAwesomeIcons.chevronDown,
                colorBorder: Colors.black38,
                colorIcon: Colors.black38,
                onTap: onTapDecrease,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomInkwellForCart(
                icon: FontAwesomeIcons.trashCan,
                colorBorder: Colors.redAccent,
                colorIcon: Colors.redAccent,
                onTap: onTapDelete,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
