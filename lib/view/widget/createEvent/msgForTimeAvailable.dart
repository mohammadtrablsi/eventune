import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MsgForTimeAvailable extends StatelessWidget {
  final int state;
  const MsgForTimeAvailable({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.all(4.w),
              child: 
                 state!=0 ? Text(
                      'Times available during the selected day : ',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  : Center(
                      child: Text(
                        'No times available during the selected day',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            );
  }
}