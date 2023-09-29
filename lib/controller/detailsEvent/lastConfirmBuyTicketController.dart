import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';

class LastConfirmBuyTicketController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  next() {
    Get.offAll(() => const bottomnav(),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 2));
  }

  backToPrevious() {
    Get.back();
  }
}
