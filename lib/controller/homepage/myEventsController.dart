import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/changelocal.dart';
import '../../../core/services/services.dart';

import '../../../core/class/statusrequest.dart';
import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/homepage/myEvents_data.dart';

class MyEventsController extends GetxController {
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  MyEventsData myEventsData = MyEventsData(Get.find());

  ScrollController scrollController = ScrollController();

  // List<MyEventsModale> insidedata = [];
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
    ;
    myEventsData.pagenumber = page;
    var response = await myEventsData.getsubcatigoriesdata(token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        data['data']['placed']['data'].forEach((element) {
          element['typePlace'] = 'placed';
          listdata.add(element);
        });
        data['data']['unplaced']['data'].forEach((element) {
          element['typePlace'] = 'unplaced';
          listdata.add(element);
        });
        // listdata.addAll(data['data']['placed']['data']);
        // listdata.addAll(data['data']['unplaced']['data']);

        print(listdata);
        update();
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

  @override
  void onInit() {
    // venueSearchTextController = TextEditingController();
    getAllMyVenues();
    // pagination();
    super.onInit();
  }
}
