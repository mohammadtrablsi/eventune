import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';

class ImageInEventDetails extends StatelessWidget {
  const ImageInEventDetails(
      {required this.image,
      super.key,
      required this.i,
      required this.ontap1,
      required this.ontap2});

  final image;
  final int i;
  final void Function()? ontap1;
  final void Function()? ontap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    width: 86.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                      color: AppColor.isDark==true?Colors.white12:Colors.black12,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                    transform: Matrix4.translationValues(-5.w, 0.0, 0.0),
                    child: InkWell(
                      onTap: ontap1,
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
                            size: 22.sp,
                            color: AppColor.primaryColor,
                          ))),
                    )),
              ],
            ),
            Container(
                transform: Matrix4.translationValues(5.w, 0.0, 0.0),
                child: InkWell(
                  onTap: ontap2,
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
                        size: 22.sp,
                        color: AppColor.primaryColor,
                      ))),
                )),
          ],
        ),
      ],
    );
  }
}
