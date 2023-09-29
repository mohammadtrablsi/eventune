import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/homepage/homePageItems_data.dart';
import '../../data/datasource/remote/homepage/suggestion_data.dart';
import '../../linkapi.dart';

class HomePageController extends GetxController {
  bool k = false;
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  HomePageItemsData homePageData = HomePageItemsData(Get.find());

  ScrollController scrollController = ScrollController();
  Map data = {};
  int length = 0;
  int page = 1;
  bool isloadmore = false;
  List listdata = [];
  List listdata2 = [];

  var token = AppLink.token;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequest1 = StatusRequest.none;

  int lastpage = 1;

  getAllMyVenues() async {
    if (isloadmore == false) {
      statusRequest1 = StatusRequest.loading;
      update();
    }
    print(statusRequest1);
    homePageData.pagenumber = page;
    var response = await homePageData.getsubcatigoriesdata("$token");
    print("=============================== Controller $response ");
    statusRequest1 = handlingData(response);
    print(statusRequest1);
    update();
    if (StatusRequest.success == statusRequest1) {
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
        // listdata.addAll(data['data']['unplaced']['data']);

        print(listdata);
        length = listdata.length;
        update();
      } else {
        statusRequest1 = StatusRequest.serverfailure;
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

  //suggestion
  SuggestionData suggestionData = SuggestionData(Get.find());

  StatusRequest statusRequest2 = StatusRequest.none;

  ScrollController scrollController2 = ScrollController();

  // List<SuggestionModale> insidedata2 = [];
  Map data2 = {};
  int length2 = 0;
  int page2 = 1;
  bool isloadmore2 = false;

  getSuggestion() async {
    if (isloadmore2 == false) {
      statusRequest2 = StatusRequest.loading;
      update();
    }
    print(statusRequest2);
    suggestionData.pagenumber = page2;
    var response = await suggestionData.getsubcatigoriesdata("$token");
    print("=============================== Controller $response ");
    statusRequest2 = handlingData(response);
    print(statusRequest2);
    update();
    if (StatusRequest.success == statusRequest2) {
      data2.addAll(response);
      if (data2["status"] == "success") {
        listdata2.addAll(data2['data']['placed']['data']);
        listdata2.addAll(data2['data']['unplaced']['data']);
        length = listdata2.length;
        update();
      } else {
        // isloading();
        statusRequest2 = StatusRequest.failure;
        update();
      }

      update();
    }
  }

  pagination2() async {
    scrollController.addListener(() async {
      if (page < lastpage) {
        if (isloadmore) return;
        if (scrollController2.position.pixels ==
            scrollController2.position.maxScrollExtent) {
          isloadmore2 = true;
          update();
          page2 = page2 + 1;
          await getSuggestion();
          isloadmore = false;
          update();
        }
      }
    });
  }

  isloading() {
    statusRequest = StatusRequest.loading;
    update();
    if (statusRequest2 == statusRequest1 &&
        statusRequest2 != StatusRequest.loading) {
      statusRequest = statusRequest2;
      update();
    } else if (statusRequest1 == StatusRequest.success &&
        statusRequest2 == StatusRequest.failure) {
      statusRequest = statusRequest2;
      update();
    } else if (statusRequest2 == StatusRequest.success &&
        statusRequest1 == StatusRequest.failure) {
      statusRequest = statusRequest1;
      update();
    }
  }

  @override
  void onInit() {
    getSuggestion();
    getAllMyVenues();
    pagination();
    pagination2();
    pagination();
    super.onInit();
  }
}
