import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import '../constant/apptheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = lighttheme;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  changetheme(value) {
    myServices.sharedPreferences.setBool("theme", value);
    if (value == true) {
      appTheme = darktheme;
      AppColor.isDark = true;
      AppColor.primaryColor = const Color(0xff2F8F9D);
      AppColor.textColor = Colors.white;
      AppColor.iconColor = Colors.white70;
    }
    if (value == false) {
      appTheme = lighttheme;
      AppColor.isDark = false;
      AppColor.primaryColor = const Color(0xff7E4FEF);
      AppColor.textColor = Colors.black;
      AppColor.iconColor = const Color.fromRGBO(29, 30, 32, 1);
    }
    Get.changeTheme(appTheme);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    var theme = myServices.sharedPreferences.getBool("theme");
    if (theme == true) {
      appTheme = darktheme;
      AppColor.isDark = true;
      AppColor.primaryColor = const Color(0xff2F8F9D);
      AppColor.textColor = Colors.white;
      AppColor.iconColor = Colors.white70;
      Get.changeTheme(appTheme);
    } else {
      appTheme = lighttheme;
      AppColor.isDark = false;
      AppColor.primaryColor = const Color(0xff7E4FEF);
      AppColor.textColor = Colors.black;
      AppColor.iconColor = const Color.fromRGBO(29, 30, 32, 1);
      Get.changeTheme(appTheme);
    }
    super.onInit();
  }
}
