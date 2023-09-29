import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';

import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/searchStoresData.dart';
import '../../data/model/searchStoreModale.dart';
import '../../linkapi.dart';

class SearchStoresController extends GetxController {
  Map mapData = {};
  List times = [];
  List dataData = [];
  List dataOfData = [];
  MyServices myServices = Get.find();
  SearchStoresData searchStoresData = SearchStoresData(Get.find());

  ScrollController scrollController = ScrollController();

  late TextEditingController venueSearchTextController =
      TextEditingController();
  List<SearchStoresModale> insidedata = [];
  List<SearchStoresModale> dataList = [];
  List listdata = [];
  Map data = {};
  int length = 0;
  // var search_text = venueSearchTextController.text;
  int page = 1;
  bool isloadmore = false;

  var token = AppLink.token;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  int lastpage = 1;

  getSearchCreateEvent4() async {
    dataList.clear();
    dataData.clear();
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    searchStoresData.query = venueSearchTextController.text;
    searchStoresData.pagenumber = page;
    var response = await searchStoresData.getsubcatigoriesdata("$token");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        listdata = data['data']['data'];
        print(listdata);
        lastpage = data['data']['last_page'];
        dataList.addAll(listdata.map((e) => SearchStoresModale.fromJson(e)));
        insidedata.addAll(dataList);
        dataData.addAll(listdata);
        dataOfData.addAll(dataData);
        length = insidedata.length;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }

      update();
    }
  }

  islist(index) {
    times.clear();
    if (dataOfData[index]['times'] is List) {
      times.add(dataOfData[index]['times']);
    } else {
      times.add(dataOfData[index]['times'].values.toList());
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
          await getSearchCreateEvent4();
          isloadmore = false;
          update();
        }
      }
    });
  }

  Future<void> clearValuesListAndFetchData() async {
    insidedata.clear();
    page = 1;
    await getSearchCreateEvent4();
  }

  void onInit() {
    // venueSearchTextController = TextEditingController();
    print(Get.arguments);
    if (Get.arguments['type'] == 'p') {
      mapData['venueId'] = Get.arguments['venueId'];
      mapData['type'] = Get.arguments['type'];
    } else {
      mapData['type'] = 'c';
      mapData['latitude'] = Get.arguments['latitude'];
      mapData['longitude'] = Get.arguments['longitude'];
    }
    mapData['date'] = Get.arguments['date'];
    mapData['time'] = Get.arguments['time'];
    print('mapData======================');
    print(mapData);
    pagination();
    super.onInit();
  }
}
