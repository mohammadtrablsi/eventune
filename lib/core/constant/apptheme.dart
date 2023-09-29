import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Eventune/core/constant/color.dart';

ThemeData darktheme = ThemeData(
  scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
    secondary: AppColor.primaryColor,
    onSecondary: AppColor.primaryColor,
  ),
  iconTheme: IconThemeData(color: AppColor.iconColor),
  textTheme: Get.locale == const Locale('en')
      ? GoogleFonts.promptTextTheme(ThemeData(
          brightness: Brightness.light,
        ).textTheme)
      : GoogleFonts.tajawalTextTheme(
          ThemeData(brightness: Brightness.light).textTheme),
  appBarTheme:
      AppBarTheme(backgroundColor: ThemeData.dark().scaffoldBackgroundColor),
);

ThemeData lighttheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primaryColor,
      secondary: AppColor.primaryColor,
      onSecondary: AppColor.primaryColor,
    ),
    iconTheme: IconThemeData(color: AppColor.iconColor),
    textTheme: Get.locale == const Locale('en')
        ? GoogleFonts.promptTextTheme(
            ThemeData(brightness: Brightness.light).textTheme)
        : GoogleFonts.tajawalTextTheme(
            ThemeData(brightness: Brightness.light).textTheme),
    appBarTheme: AppBarTheme(
        backgroundColor: ThemeData.light().scaffoldBackgroundColor));
