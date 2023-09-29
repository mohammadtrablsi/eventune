import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../linkapi.dart';

class EventDetialsController extends GetxController {
  // var photoOfStore;
  var isMyEvent;
  late List photos;
  late Map datalist;
  int Index = 0;
  var type;
  var eventId;

  StatusRequest statusRequest = StatusRequest.none;
  var token = AppLink.token;
  late TextEditingController promotTextController = TextEditingController();
  // var isUser;
  // var name;
  int i = 0;

  getIndex(index) {
    Index = index;
    print(Index);
    update();
  }

  buttonforimages(String type) {
    if (type == "right") {
      if (i == photos.length - 1) {
        i = i;
      } else {
        i += 1;
      }
      update();
    } else {
      if (i == 0) {
        i = i;
      } else {
        i -= 1;
      }
      update();
    }
  }

  //promot
  Map dataRelay = {};
  // PromoteData promoteData = PromoteData(Get.find());
  promot() async {}

  @override
  void onInit() {
    datalist = Get.arguments[0]['datalist'];
    isMyEvent = Get.arguments[0]['isMyEvent'];
    photos = datalist['photos'];
    // var promationId = 1;
    eventId = datalist['id'];
    if (datalist['section_id'] != null) {
      type = "placed";
    } else {
      type = "unplaced";
    }

    print("xxxxxxxx${datalist}");
    super.onInit();
  }
}
