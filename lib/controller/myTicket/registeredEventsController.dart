import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/changelocal.dart';
import '../../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/myTicket/registeredEvents_data.dart';
import '../../linkapi.dart';

class RegisteredEventsController extends GetxController {
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  RegisteredEventsData registeredEventsData = RegisteredEventsData(Get.find());

  ScrollController scrollController = ScrollController();

  // List<RegisteredEventsModale> insidedata = [];
  Map data = {};
  int length = 0;
  var search_text = "alafrah";
  int page = 1;
  bool isloadmore = false;
  List listdata = [];
  var token = AppLink.token;
  StatusRequest statusRequest = StatusRequest.none;
  int lastpage = 1;

  getAllMyVenues() async {
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    registeredEventsData.pagenumber = page;
    var response = await registeredEventsData.getsubcatigoriesdata(token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List mydata1 = data['data']['placed']['data'];
        List mydata2 = data['data']['unplaced']['data'];
        for (int i = 0; i < mydata1.length; i++) {
          listdata.add(mydata1[i]);
        }
        for (int i = 0; i < mydata2.length; i++) {
          listdata.add(mydata2[i]);
        }
        if(listdata.isEmpty){
          statusRequest=StatusRequest.failure;
        }
        update();
        // print("xxxxxxxxxxxxxxxxxxxxxxxxxxx${listdata[0]}");
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }

      update();
    }
  }

  pagination() async {
    scrollController.addListener(() async {
      if (page < lastpage) {
        if (isloadmore) return;
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          isloadmore = true;
          update();
          page = page + 1;
          await getAllMyVenues();
          isloadmore = false;
          update();
        }
      }
    });
  }

  void onInit() {
    getAllMyVenues();
    super.onInit();
  }
}
