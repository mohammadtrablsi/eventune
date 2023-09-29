import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constant/color.dart';

class ImageAndTextInVenueProfile extends StatelessWidget {
  const ImageAndTextInVenueProfile({required this.text,required this.image, super.key,required this.i,required this.leftButton,required this.rightButton,required this.height,required this.width,required this.sizeoftext});
  final  image;
  final String text;
  final i;
  final void Function()? leftButton;
  final void Function()? rightButton;
  final height;
  final width;
  final sizeoftext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                        color: AppColor.isDark!=true?Colors.black12:Colors.white12,
                      ),
                    ),
                    Container(
                        transform: Matrix4.translationValues(-4.w, 0.0, 0.0),
                        child: InkWell(
                          onTap:leftButton,
                          child: Container(
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 16.sp,
                                color: AppColor.primaryColor,
                              ))),

                        )),
                  ],
                ),
                Container(
                    transform: Matrix4.translationValues(4.w, 0.0, 0.0),
                    child: InkWell(
                      onTap:rightButton,
                      child: Container(
                          padding: EdgeInsets.all(1.w),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.sp,
                            color: AppColor.primaryColor,
                          ))),
                    )),
              ],
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: sizeoftext, fontWeight: FontWeight.bold,color: AppColor.iconColor),
            )
          ],
        ),
      ],
    );
  }
}
