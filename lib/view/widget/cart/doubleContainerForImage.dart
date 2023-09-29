import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/share/cacheImage.dart';
import 'package:sizer/sizer.dart';

class DoubleContainerForImage extends StatelessWidget {
  final String imageUrl;
  const DoubleContainerForImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 12.h,
        width: 26.w,
        decoration: BoxDecoration(
            color: const Color.fromARGB(25, 0, 0, 0),
            borderRadius: BorderRadius.circular(1.5.h)),
        child: Container(
          height: 10.h,
          width: 22.w,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(1.5.h)),
          child: CustomCacheImage(
              imageUrl:imageUrl),
        ));
  }
}
