//Notifications
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/core/services/services.dart';

import '../constant/constData.dart';

MyServices myServices = Get.find();
Future<void> initializeLocalNotifications() async {
  await AwesomeNotifications().initialize(
    null, //'resource://drawable/res_app_icon',//
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Alerts',
        channelDescription: 'Notification tests as alerts',
        playSound: true,
        onlyAlertOnce: true,
        groupAlertBehavior: GroupAlertBehavior.Children,
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Private,
        defaultColor: AppColor.primaryColor,
        ledColor: AppColor.primaryColor,
      )
    ],
  );
}

Future<void> startListeningNotificationEvents() async {
  AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
    Get.offAll(screenWidget);
  });
}

showNotification(String body, id) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: body,
          category: NotificationCategory.Event,
          backgroundColor: AppColor.primaryColor,
          color: AppColor.primaryColor,
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/image/logo.png',
          actionType: ActionType.Default),
      schedule: NotificationCalendar.fromDate(
          date: DateTime.now().add(const Duration(seconds: 1))));
}
