import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';

class VenuItem extends StatelessWidget {
  const VenuItem(
      {super.key,
      required this.text,
      required this.image,
      required this.ontap,
      required this.rate});
  final text;
  final image;
  final void Function()? ontap;
  final rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0.w),
          onTap: ontap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.w),
            ),
            elevation: 7,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 12.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0.w),
                        topRight: Radius.circular(5.0.w),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.black12,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        top: 3.w, bottom: 4.w, start: 2.h, end: 4.h),
                    // height: 6.h,
                    // width: 85.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0.w),
                          bottomRight: Radius.circular(5.0.w),
                        ),
                        color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 35.w,
                          child: Text(
                            text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                        const Spacer(),
                        RatingBar(
                          initialRating: rate,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: AppColor.primaryColor,
                            ),
                            half: Icon(
                              Icons.star_half,
                              color: AppColor.primaryColor,
                            ),
                            empty: const Icon(
                              Icons.star_border,
                            ),
                          ),
                          ignoreGestures: true,
                          onRatingUpdate: (double value) {},
                          itemSize: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 1.8.h),
      ],
    );
  }
}
