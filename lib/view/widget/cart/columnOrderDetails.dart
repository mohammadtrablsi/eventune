import 'package:flutter/material.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/widget/cart/rowTextForCart.dart';
import 'package:sizer/sizer.dart';

class ColumnOrderDetails extends StatelessWidget {
  final String subTotalPrice;
  final String totalPrice;
  final String shoppingCost;

  const ColumnOrderDetails(
      {super.key,
      required this.subTotalPrice,
      required this.totalPrice,
      required this.shoppingCost});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 18.h,
        width: 100.w,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColor.iconColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                  )
                ],
              ),
              RowTextForCart(
                text1: 'SubTotal',
                text2: subTotalPrice,
              ),
              RowTextForCart(
                text1: 'Shopping Cost',
                text2: shoppingCost,
              ),
              RowTextForCart(
                text1: 'Total',
                text2: totalPrice,
              ),
            ]));
  }
}
