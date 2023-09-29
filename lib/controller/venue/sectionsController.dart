import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/services.dart';

import '../../../core/class/statusrequest.dart';
import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/venue/sectionsData.dart';
import '../../data/model/SectionsModale.dart';

class SectionsController extends GetxController {
  MyServices myServices = Get.find();
  SectionsData sectionsData = SectionsData(Get.find());

  ScrollController scrollController = ScrollController();

  List<SectionsModale> insidedata = [];
  List listData=[];
  Map data = {};
  int length = 0;
  int page = 1;
  bool isloadmore = false;

  var token = AppLink.token;
  var id;
  StatusRequest statusRequest = StatusRequest.none;
  int lastpage = 1;
  var name;

  getAllMyVenues() async {
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    sectionsData.id = id;
    sectionsData.pagenumber = page;
    var response = await sectionsData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        lastpage = data['data']['last_page'];
        listData=listdata;
        insidedata.addAll(listdata.map((e) => SectionsModale.fromJson(e)));
        length = insidedata.length;
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

  void onInit() {
    id = Get.arguments[0]['id'];
    name = Get.arguments[0]['name'];
    // venueSearchTextController = TextEditingController();
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
