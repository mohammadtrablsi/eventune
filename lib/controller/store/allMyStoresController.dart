import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/services/services.dart';

import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/store/AllMyStores_data.dart';
import '../../data/model/allMyStoresModale.dart';

class AllMyStoresController extends GetxController {
  MyServices myServices = Get.find();
  AllMyStoresData allMyStoresData = AllMyStoresData(Get.find());
  List times = [];
  List listData = [];

  ScrollController scrollController = ScrollController();

  List<AllMyStoresModale> insidedata = [];
  // var islist;
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
    allMyStoresData.query = search_text;
    allMyStoresData.pagenumber = page;
    var response = await allMyStoresData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List datalistdata = data['data']['data'];
        listdata.addAll(datalistdata);
        lastpage = data['data']['last_page'];
        listData = data['data']['data'];
        print(listData);
        insidedata
            .addAll(datalistdata.map((e) => AllMyStoresModale.fromJson(e)));
        length = insidedata.length;
        // if(listdata[0]['times'] is List ){
        //   // islist=true;
        //   print("=========================islist${listdata[0]['times']}");
        // }
        // else{
        //   // islist=false;
        //   List dataList=[];
        //   List times=[];
        //   dataList = listdata[0]['times'].values.toList();
        //   /////// listdata[2]['times'].toList();
        //   times.addAll(dataList);
        //   print("========================time in key value${listdata[5]['times'].values.toList()}");
        // }
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

  islist(index) {
    times.clear();
    if (listdata[index]['times'] is List) {
      times.add(listdata[index]['times']);
    } else {
      times.add(listdata[index]['times'].values.toList());
    }
  }

  void onInit() {
    // venueSearchTextController = TextEditingController();
    getAllMyVenues();
    pagination();
    super.onInit();
  }
}
