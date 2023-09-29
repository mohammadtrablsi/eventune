import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

import '../../view/screen/eventDetails/confirmBuyTicketScreen.dart';

class EventDetailsScreenController extends GetxController {
  late GlobalKey previewContainer;
  bool isOpenChat = false;
  Map mapData = {};
  @override
  void onInit() {
    previewContainer = GlobalKey();
    mapData = Get.arguments[0]['datalist'];
    print(mapData);
    super.onInit();
  }

  shareScreen() async {
    print('share...');
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      ShareFilesAndScreenshotWidgets().shareScreenshot(
          previewContainer, 100, "Send to", "Name.png", "image/png",
          text:
              "Shared from the EvenTune app \'https://Eventune.page.link/zXbp\'");
    } else {
      // Handle permission denied
    }
  }

  showOrHideChat() {
    isOpenChat = !isOpenChat;
    update();
  }

  backToPrevious() {
    Get.offAll(() => const bottomnav(),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 1));
  }

  buyTicket() {
    Get.to(() => const ConfirmBuyTicketScreen(),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(seconds: 2),
        arguments: mapData);
  }
}
