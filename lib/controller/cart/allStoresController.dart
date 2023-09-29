import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/services/services.dart';

import '../../../linkapi.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/model/allStoresModale.dart';
import '../../data/datasource/remote/cart/allStores_data.dart';

class AllStoresController extends GetxController {
  Map mapData = {};
  Map mapData2 = {};

  List times = [];
  List listdata = [];
  MyServices myServices = Get.find();
  AllStoresData allStoresData = AllStoresData(Get.find());

  ScrollController scrollController = ScrollController();

  List<AllStoresModale> insidedata = [];
  Map data = {};
  int length = 0;
  var search_text = "alafrah";
  int page = 1;
  bool isloadmore = false;

  var token = AppLink.token;
  late TextEditingController venueSearchTextController =
      TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  int lastpage = 1;

  getCreateEvent4() async {
    if (isloadmore == false) {
      statusRequest = StatusRequest.loading;
      update();
    }
    print(statusRequest);
    allStoresData.query = search_text;
    allStoresData.pagenumber = page;
    var response = await allStoresData.getsubcatigoriesdata("$token");
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
        insidedata.addAll(datalistdata.map((e) => AllStoresModale.fromJson(e)));
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
          await getCreateEvent4();
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
    getCreateEvent4();
    pagination();

    mapData2 = Get.arguments;
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

    //{id_category: 1, name: oakasdda, description: kmdaskdaskdask, capacity: 100, privacy: public, equpement: 0}
    super.onInit();
  }
}
