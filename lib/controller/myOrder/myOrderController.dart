import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/services.dart';

import '../../../core/class/statusrequest.dart';
import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/myOrder/myOrderC_data.dart';
import '../../data/model/myOrderDataModale.dart';

class MyOrderController extends GetxController {
  MyServices myServices = Get.find();
  MyOrderData myOrderData = MyOrderData(Get.find());
  ScrollController scrollController = ScrollController();
  List<MyOrderDataModale> insidedata = [];
  // List acceptedData=[];
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
    // amyOrderData.Storeid = storeid;
    myOrderData.pagenumber = page;
    var response = await myOrderData.getsubcatigoriesdata(token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        lastpage = data['data']['last_page'];
        insidedata.addAll(listdata.map((e) => MyOrderDataModale.fromJson(e)));

        length = insidedata.length;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }

      update();
    }
  }

  int totalPrice(index) {
    int price = 0; // Initialize price to 0
    for (int i = 0; i < insidedata[index].products!.length; i++) {
      if (insidedata[index].products![i].price != null) {
        price = price + insidedata[index].products![i].price!;
      }
    }
    return price;
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
    // storeid = Get.arguments[0]['id'];
    print(storeid);
    // for(int f=0;f<acceptedData.length;f++){
    //   acceptedData[f];
    // }

    // print("============================================${acceptedData[0].id}");
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
