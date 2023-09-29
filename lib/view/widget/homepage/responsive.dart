//
import 'package:flutter/material.dart';

getdevicetype(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double height = mediaQueryData.size.height;
  if (orientation == Orientation.landscape) {
    height = mediaQueryData.size.width;
  } else {
    height = mediaQueryData.size.height;
  }
  if (height >= 1400) {
    return "desktop";
  }
  if (height >= 1000 && height < 1399) {
    return "tablet";
  }
  if (height >= 734 && height < 999) {
    return "mobile";
  }
  if (height < 733) {
    return "small mobile";
  }
}
