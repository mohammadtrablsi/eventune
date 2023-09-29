import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/services/services.dart';

class AppColor {
  MyServices myServices = Get.find();
  static const Color backgroundcolor = Color(0xff343541);
  static bool? isDark;
  static Color primaryColor =
      isDark != true ? const Color(0xff7E4FEF) : const Color(0xff2F8F9D);
  static Color textColor = isDark != true ? Colors.black : Colors.white;
  static Color iconColor =
      isDark != true ? const Color.fromRGBO(29, 30, 32, 1) : Colors.white70;
}
