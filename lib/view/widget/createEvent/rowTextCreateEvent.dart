import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RowTextCreateEvent extends StatelessWidget {
  final String text1;
  final String text2;

  const RowTextCreateEvent({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
            '$text1 : ',
            style: TextStyle(
                fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
                 ),
                
         
        Expanded(
          child: Text(
            text2,
            style:  TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
           
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
