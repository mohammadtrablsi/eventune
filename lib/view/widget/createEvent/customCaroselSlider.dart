import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/share/cacheImage.dart';
import 'package:sizer/sizer.dart';

class CustomCaroselSlider extends StatelessWidget {
  final CarouselController? carouselController;
  final List<String> images;
  final int initpage;
  final void Function()? onPressedPrevious;
  final void Function()? onPressedNext;
  const CustomCaroselSlider(
      {super.key,
      this.carouselController,
      required this.images,
      required this.initpage,
      this.onPressedPrevious,
      this.onPressedNext});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 35.h,
            width: double.infinity,
            child: CarouselSlider(
                carouselController: carouselController,
                items: List.generate(
                  images.length,
                  (index) => SizedBox(
                      height: 35.h,
                      width: double.infinity,
                      child: CustomCacheImage(imageUrl: images[index])),
                ),
                options: CarouselOptions(
                  aspectRatio: 1,
                  initialPage: initpage,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                )),
          ),
          Container(
            height: 35.h,
            width: double.infinity,
            color: Colors.black26,
          ),
          initpage > 0
              ? Positioned(
                  bottom: 32.h / 2,
                  left: 1.2.w,
                  child: IconButton(
                      onPressed: onPressedPrevious,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30.sp,
                      )),
                )
              : const SizedBox(),
          initpage < images.length - 1
              ? Positioned(
                  bottom: 32.h / 2,
                  right: 1.2.w,
                  child: IconButton(
                      onPressed: onPressedNext,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 30.sp,
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
