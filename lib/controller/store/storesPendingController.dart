import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/store/replayStorePendingData.dart';
import '../../data/datasource/remote/store/storesPending_data.dart';
import '../../data/model/storePendingModale.dart';

class StoresPendingController extends GetxController {
  TextEditingController rejectInTextController = TextEditingController();
  MyServices myServices = Get.find();
  StorePendingData storePendingData = StorePendingData(Get.find());
  ScrollController scrollController = ScrollController();
  List<StorePendingModale> insidedata = [];
  List acceptedData = [];
  var storeid;
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
    storePendingData.storeid = storeid;
    storePendingData.pagenumber = page;
    var response = await storePendingData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        lastpage = data['data']['last_page'];
        insidedata.addAll(listdata.map((e) => StorePendingModale.fromJson(e)));
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

  //pending accept or reject
  Map dataRelay = {};
  ReplayStorePendingData replayStorePendingData =
      ReplayStorePendingData(Get.find());

  replay(reqid, resultOfReplay, index, isAccept) async {
    // statusRequest = StatusRequest.loading;
    replayStorePendingData.reqid = reqid;
    replayStorePendingData.resultOfReplay = resultOfReplay;
    print(reqid);
    print(resultOfReplay);
    update();
    var response;
    if (isAccept) {
      response = await replayStorePendingData.accept("$token");
    } else {
      replayStorePendingData.reasone = rejectInTextController.text;
      response = await replayStorePendingData.reject("$token");
    }
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        insidedata.remove(insidedata[index]);
        Get.snackbar(dataRelay['status'], dataRelay['message'],
            colorText: Colors.white,
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 5));
        update();
        // Get.back();
      } else {
        Get.snackbar(dataRelay['status'], dataRelay['message'],
            colorText: Colors.white,
            backgroundColor: Colors.red.withOpacity(0.7),
            duration: const Duration(seconds: 2));
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      update();
      return Get.snackbar("warning", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      update();
      return Get.snackbar("warning", "404 server faliure");
    }
    update();
  }

  void onInit() {
    storeid = Get.arguments[0]['id'];
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
