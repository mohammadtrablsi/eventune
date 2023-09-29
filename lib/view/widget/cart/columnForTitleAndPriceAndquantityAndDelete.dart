import 'package:flutter/material.dart';

import 'package:Eventune/view/widget/cart/rowQuantityAndDelete.dart';
import 'package:sizer/sizer.dart';

class ColumnForTitleAndPriceAndquantityAndDelete extends StatelessWidget {
  final String title;
  final String price;
  final String quantity;
  final void Function()? onTapIncrease;
  final void Function()? onTapDecrease;
  final void Function()? onTapDelete;
  const ColumnForTitleAndPriceAndquantityAndDelete(
      {super.key,
      required this.title,
      required this.price,
      this.onTapIncrease,
      this.onTapDecrease,
      this.onTapDelete, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Price : $price',
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black38,
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          RowQuantityAndDelete(
              quantity: quantity,
              onTapIncrease: onTapIncrease,
              onTapDecrease: onTapDecrease,
              onTapDelete: onTapDelete),
        ]);
  }
}
