import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';

import '../../../core/services/services.dart';
import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/createEvent/searchAllVenueOfCategories_data.dart';

class SearchAllVenueOfCategoriesController extends GetxController {
  MyServices myServices = Get.find();
  SearchAllVenueOfCategoriesData searchAllVenueOfCategoriesData =
      SearchAllVenueOfCategoriesData(Get.find());

  ScrollController scrollController = ScrollController();
  /////////////
  //this entered from prev screen
  var catiid;
  var capicty;
  ///////////

  late TextEditingController venueSearchTextController =
      TextEditingController();
  dynamic insidedata;

  List dataList = [];
  List valuesList = [];
  Map data = {};
  Map mapData = {};
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
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    searchAllVenueOfCategoriesData.query = venueSearchTextController.text;
    searchAllVenueOfCategoriesData.pagenumber = page;
    searchAllVenueOfCategoriesData.catiid =
        Get.arguments[0]['data']['id_category'];
    searchAllVenueOfCategoriesData.capicty =
        int.parse(Get.arguments[0]['data']['capacity']);

    var response = await searchAllVenueOfCategoriesData
        .getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        if (data['data']['data'].isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
          // statusRequest = StatusRequest.failure;
          // print(statusRequest);
          // update();
        } else {
          insidedata = data['data']['data'];
          dataList = insidedata.values.toList();
          valuesList.addAll(dataList);

          // insidedata.entries.map((e)=> e.value).toList();
          lastpage = data['data']['last_page'];

          length = valuesList.length; //insidedata
          update();
        }
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
          await getSearchCreateEvent4();
          isloadmore = false;
          update();
        }
      }
    });
  }

  Future<void> clearValuesListAndFetchData() async {
    valuesList.clear();
    page = 1;
    await getSearchCreateEvent4();
  }

  void onInit() {
    mapData = Get.arguments[0]['data'];
    print(Get.arguments[0]['data']);
    pagination();
    // venueSearchTextController = TextEditingController();
    super.onInit();
  }
}
