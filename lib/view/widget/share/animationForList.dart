import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationForList extends StatelessWidget {
  final int index;
  final Widget widget;
  const AnimationForList(
      {super.key, required this.index, required this.widget});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: index,
        //duration: const Duration(milliseconds: 2500),
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 30,
            verticalOffset: 300.0,
            child: FlipAnimation(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: widget)));
  }
}
