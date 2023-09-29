import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../../../core/functions/selectPosition.dart';
import 'doubleContainerForImage.dart';

class ColumnDeliveryAddressDetails extends StatelessWidget {
  final String imageUrl;
  final String location;
  final double longitude;
  final double latitude;
  final bool ok;
  final void Function()? onTapForGoToMap;
  const ColumnDeliveryAddressDetails(
      {super.key,
      required this.imageUrl,
      required this.location,
      this.onTapForGoToMap,
      required this.longitude,
      required this.latitude,
      required this.ok});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.amber,
      height: 17.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Address',
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Row(
              children: [
                DoubleContainerForImage(
                  imageUrl: imageUrl,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ok
                          ? FutureBuilder<String>(
                              future: getAddress(latitude, longitude),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Text(
                                    '${snapshot.data}',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }
                              },
                            )
                          : Text(
                              'Event place',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: onTapForGoToMap,
                        child: Row(
                          children: [
                            Text(
                              'Go To Map ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black38,
                              ),
                            ),
                            const FaIcon(Icons.location_on_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColumnDeliveryAddressDetails2 extends StatelessWidget {
  final String imageUrl;

  const ColumnDeliveryAddressDetails2({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.amber,
      height: 17.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Address',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Row(
              children: [
                DoubleContainerForImage(
                  imageUrl: imageUrl,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Delivery Address Not Avaliable',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColor.iconColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
