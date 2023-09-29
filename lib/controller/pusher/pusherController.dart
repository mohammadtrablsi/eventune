import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/functions/changeFormatTime.dart';
import 'package:Eventune/core/services/services.dart';
import 'package:Eventune/view/screen/store/allMyStores.dart';
import 'package:Eventune/view/screen/store/selectAvailableTimeScreen.dart';
import 'package:Eventune/view/screen/venue/allMyVenues.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../core/constant/constData.dart';
import '../../core/functions/notifications.dart';
import '../../view/screen/notifycation/stateScreen.dart';

class PusherController extends GetxController {
  MyServices myServices = Get.find();
  String pusherAppKey = '28879e97b350edc7d3bb';
  String pusherAppCluster = 'ap1';
  String pusherAppSecret = 'ce828c8d4ccfd142340c';
  int? userId;
  PusherChannelsFlutter? pusher;
  @override
  void onInit() {
    pusher = PusherChannelsFlutter.getInstance();
    onConnect();
    userId = myServices.sharedPreferences.getInt('id');
    print(userId);

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    //pusher?.unsubscribe(channelName:)
    super.onClose();
  }

  void log(String text) {
    print("LOG: $text");
  }
  // pusher?.trigger(PusherEvent(channelName: 'channelName', eventName: 'eventName',data: []));

  void onConnect() async {
    try {
      await pusher?.init(
          apiKey: pusherAppKey,
          cluster: pusherAppCluster,
          onConnectionStateChange: onConnectionStateChange,
          onError: onError,
          onSubscriptionSucceeded: onSubscriptionSucceeded,
          onEvent: onEvent,
          onSubscriptionError: onSubscriptionError,
          onDecryptionFailure: onDecryptionFailure,
          onMemberAdded: onMemberAdded,
          onMemberRemoved: onMemberRemoved,
          onSubscriptionCount: onSubscriptionCount,
          // authEndpoint: "<Your Authendpoint Url>",
          onAuthorizer: onAuthorizer);
      await pusher?.subscribe(
        channelName: 'private-notifications.$userId',
      );
      await pusher?.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  getSignature(String value) {
    var key = utf8.encode(pusherAppSecret);
    var bytes = utf8.encode(value);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    //print("HMAC signature in string is: $digest");
    return digest;
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "$pusherAppKey:${getSignature("$socketId:$channelName")}",
    };
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: ${event.data}");
    var data = jsonDecode(event.data);
    if (data['message'] != null) {
      listNotification.add(data['message'].toString());
      listTimeNotification.add('${changeFormatTime(TimeOfDay.now())}');
      numberOfNotification++;
      myServices.sharedPreferences
          .setStringList('notification', listNotification);
      myServices.sharedPreferences
          .setStringList('timesNotification', listTimeNotification);
      showNotification('${data['message']}', Random().nextInt(1000));
      notifycationsProccess(data);
    }
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher?.getChannel(channelName)?.me;
    log("Me ======: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  notifycationsProccess(Map data) {
    print('===========================================notifycation');
    if (data['name'] == 'Venue' || data['name'] == 'venue') {
      if (data['status'] == 'accept') {
        myServices.sharedPreferences.setInt('venue', 3);
        myServices.sharedPreferences.setString('type', 'venue');
        myServices.sharedPreferences.setInt('venueId', data['venue_id']);
        screenWidget = const SelectAvailableTimeScreen();
      } else if (data['Status'] == 'Unavailable') {
      } else if (data['Status'] == 'Available') {
        screenWidget = const AllMyVenues();
      }
    }
    if (data['name'] == 'store' || data['name'] == 'Store') {
      if (data['status'] == 'accept') {
        myServices.sharedPreferences.setInt('store', 3);
        myServices.sharedPreferences.setInt('storeId', data['store_id']);
        myServices.sharedPreferences.setString('type', 'store');
        screenWidget = const SelectAvailableTimeScreen();
      } else if (data['status'] == 'Unavailable') {
      } else if (data['status'] == 'Available') {
        screenWidget = const AllMyStores();
      }
    }
    if (data['name'] == 'Event') {
      screenWidget = const AllMyStores();
      if (data['status'] == 'Pending') {
        screenWidget = const StateScreen(
          numState: 1,
        );
      } else if (data['status'] == 'accept') {
        screenWidget = const StateScreen(
          numState: 2,
        );
      } else if (data['status'] == 'reject') {
        screenWidget = const StateScreen(
          numState: 2,
        );
      }
    }
    if (data['name'] == 'Order') {
      if (data['status'] == 'Pending') {
        print('1');
        screenWidget = const StateScreen(
          numState: 1,
        );
      } else if (data['status'] == 'accept') {
        print('1');
        screenWidget = const StateScreen(
          numState: 2,
        );
      } else if (data['status'] == 'reject') {
        screenWidget = const StateScreen(
          numState: 3,
        );
      }
    }
  }
}
