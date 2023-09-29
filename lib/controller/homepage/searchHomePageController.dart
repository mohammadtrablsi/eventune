import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/homepage/searchHomePage_data.dart';
import '../../linkapi.dart';

class SearchHomePageController extends GetxController {
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  SearchHomePageData searchHomePageData = SearchHomePageData(Get.find());

  ScrollController scrollController = ScrollController();

  late TextEditingController homePageSearchTextController =
      TextEditingController();
  // List<SearchHomePageModale> insidedata = [];
  Map data = {};
  int length = 0;
  // var search_text = venueSearchTextController.text;
  int page = 1;
  bool isloadmore = false;
  List listdata = [];

  var token = AppLink.token;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  int lastpage = 1;

  getSearchCreateEvent4() async {
    // insidedata.clear();
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    searchHomePageData.query =
        homePageSearchTextController.text; /////venueSearchTextController.text
    print(homePageSearchTextController.text);
    //searchHomePageData.pagenumber = page;
    var response = await searchHomePageData.getsubcatigoriesdata("$token");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        listdata.addAll(data['data']['placed']['data']);
        listdata.addAll(data['data']['unplaced']['data']);
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
          await getSearchCreateEvent4();
          isloadmore = false;
          update();
        }
      }
    });
  }

  @override
  void onInit() {
    homePageSearchTextController = TextEditingController();
    super.onInit();
  }
}
