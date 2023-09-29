
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../core/class/statusrequest.dart';
import '../../linkapi.dart';

// ignore: camel_case_types
class registeredEventsDetailsController extends GetxController {
  // var photoOfStore;
  var isMyEvent;
  late List photos;
   Map datalist={};
  int Index=0;
  StatusRequest statusRequest = StatusRequest.none;
  var token=AppLink.token;
  late TextEditingController promotTextController = TextEditingController();
  // var isUser;
  // var name;
  int i = 0;

  getIndex(index){
    Index=index;
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


  @override
  void onInit() {
    datalist = Get.arguments[0]['datalist'];
    isMyEvent = Get.arguments[0]['isMyEvent'];
    photos= datalist['photos'];
    // print("xxxxxxxx${datalist}");
    super.onInit();
  }
}
