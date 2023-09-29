import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/venue/accept_data.dart';
import '../../data/model/acceptModale.dart';

class AcceptController extends GetxController {
  MyServices myServices = Get.find();
  AcceptData acceptData = AcceptData(Get.find());

  ScrollController scrollController = ScrollController();

  List<AcceptModale> insidedata = [];
  // List acceptedData=[];
  var venid;
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
    acceptData.venid = venid;
    acceptData.pagenumber = page;
    var response = await acceptData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        lastpage = data['data']['last_page'];
        insidedata.addAll(listdata.map((e) => AcceptModale.fromJson(e)));
        // for(int i=0;i<insidedata.length;i++){
        //   for(int j=0;j<insidedata[i].events!.length;j++) {
        //     acceptedData.add(insidedata[i].events![j]);
        //   }
        // }
        // print("==================================$acceptedData");
        // for(int f=0;f<acceptedData.length;f++){
        //   print(acceptedData[f].id);
        // }
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
    venid = Get.arguments[0]['id'];
    // for(int f=0;f<acceptedData.length;f++){
    //   acceptedData[f];
    // }

    // print("============================================${acceptedData[0].id}");
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
