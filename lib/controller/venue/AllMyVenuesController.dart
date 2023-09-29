import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/venue/allMyVenues_data.dart';
import '../../data/model/AllMyVenuesModale.dart';

class AllMyVenuesController extends GetxController {
  MyServices myServices = Get.find();
  AllMyVenuesData createEvent4Data = AllMyVenuesData(Get.find());

  ScrollController scrollController = ScrollController();

  List<AllMyVenuesModale> insidedata = [];
  List listData=[];
  Map data = {};
  int length = 0;
  var search_text = "alafrah";
  int page = 1;
  bool isloadmore = false;

  var token = AppLink.token;
  StatusRequest statusRequest = StatusRequest.none;
  int lastpage = 1;

  getAllMyVenues() async {
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    createEvent4Data.query = search_text;
    createEvent4Data.pagenumber = page;
    var response = await createEvent4Data.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        listData=data['data']['data'];
        lastpage = data['data']['last_page'];
        insidedata.addAll(listdata.map((e) => AllMyVenuesModale.fromJson(e)));
        // print("the listdata in allmyvenues $listdata");
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
    // venueSearchTextController = TextEditingController();
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
