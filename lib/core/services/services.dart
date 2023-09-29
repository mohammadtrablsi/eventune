import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/core/constant/constData.dart';
import 'package:Eventune/linkapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/deepLinkController.dart';
import '../functions/notifications.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await initializeLocalNotifications();
    await startListeningNotificationEvents();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  // DeepLinkController.initDynamicLinks();
  DeepLinkController.initDynamicLinks();

  MyServices myServices = Get.find();
  AppColor.isDark = myServices.sharedPreferences.getBool('theme');
  print(AppColor.isDark);
  // myServices.sharedPreferences.clear();
  if (myServices.sharedPreferences.getString('token') != null) {
    AppLink.token = myServices.sharedPreferences.getString('token')!;
  }
  if (myServices.sharedPreferences.getStringList('notification') != null) {
    listNotification =
        myServices.sharedPreferences.getStringList('notification')!;
    listTimeNotification =
        myServices.sharedPreferences.getStringList('timesNotification')!;
  }
}
