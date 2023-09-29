import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/venue/pending_data.dart';
import '../../data/datasource/remote/venue/replaypending_data.dart';
import '../../data/model/pendingModale.dart';

class PendingController extends GetxController {
  late TextEditingController rejectTextController = TextEditingController();
  MyServices myServices = Get.find();
  PendingData pendingData = PendingData(Get.find());
  ScrollController scrollController = ScrollController();
  List<PendingModale> insidedata = [];
  List acceptedData = [];
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
    pendingData.venid = venid;
    pendingData.pagenumber = page;
    var response = await pendingData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        lastpage = data['data']['last_page'];
        insidedata.addAll(listdata.map((e) => PendingModale.fromJson(e)));
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
  ReplayPendingData replaypendingData = ReplayPendingData(Get.find());
  replay(reqid, resultOfReplay, index, indexo, isAccept) async {
    // statusRequest = StatusRequest.loading;
    replaypendingData.reqid = reqid;
    replaypendingData.resultOfReplay = resultOfReplay;
    print(reqid);
    print(resultOfReplay);
    update();
    var response;
    if (isAccept) {
      response = await replaypendingData.accept(AppLink.token);
    } else {
      replaypendingData.reasone = rejectTextController.text;
      response = await replaypendingData.reject(AppLink.token);
    }
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        insidedata[index].requests?.remove(insidedata[index].requests![indexo]);
        Get.snackbar(dataRelay['status'], dataRelay['message']);
        update();
        // Get.back();
      } else {
        Get.snackbar(dataRelay['status'], dataRelay['message']);
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
    venid = Get.arguments[0]['id'];
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
