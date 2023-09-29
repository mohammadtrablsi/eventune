import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class Onboardingcontroller extends GetxController {
  var indexpage = 0;
  PageController pagecontroller = PageController();

  setindex(value) {
    indexpage = value;
    update();
  }

  transport() {
    indexpage++;
    //to make the have ability to move thepage to the next page
    pagecontroller.animateToPage(indexpage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    //
    update();
  }

  skip() {
    Get.toNamed(AppRoute.login);
  }

  gotoregister() {
    Get.toNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
