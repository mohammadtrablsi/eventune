import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Eventune/core/constant/imgaeasset.dart';
import 'package:Eventune/view/screen/eventDetails/eventDetalisScreenForInvite.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class DeepLinkController {
  static String? idEvent;
  static String? type;
  static GlobalKey previewContainer = GlobalKey();

  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  static void initDynamicLinks() async {
    dynamicLinks.onLink.listen(
      (PendingDynamicLinkData dynamicLink) async {
        final Uri deeplink = dynamicLink.link;
        handleMyLink(deeplink);
      },
    ).onError((error) {
      print('onLink error');
    });
  }

  static void handleMyLink(Uri url) {
    List<String> sepeatedLink = [];
    sepeatedLink.addAll(url.path.split('/'));
    type = sepeatedLink[1];
    idEvent = sepeatedLink[2];
    print("The Token that i'm interesed in is $sepeatedLink");
    Get.to(() => const EventDetailsForInviteScreen());
    print('------------------------------------');
  }

  static shareScreen(url) async {
    print('share...');
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      ShareFilesAndScreenshotWidgets().shareScreenshot(
          previewContainer, 100, "Send to", "Name.png", "image/png",
          text: "Inveted from the EvenTune app $url ");
    } else {
      // Handle permission denied
    }
  }

  static buildDynamicLinks(String title, String info) async {
    String url = "https://Eventune.page.link";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/$info'),
      androidParameters: const AndroidParameters(
        packageName: "com.example.Eventune",
        minimumVersion: 0,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: 'EvenTune',
          imageUrl: Uri.parse(AppImageAsset.event),
          title: title),
    );
    final ShortDynamicLink dynamicUrl =
        await dynamicLinks.buildShortLink(parameters);
    String? desc = dynamicUrl.shortUrl.toString();
    print('-------> $desc');
    shareScreen(desc);
  }
}
