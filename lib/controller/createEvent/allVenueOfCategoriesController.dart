import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/linkapi.dart';
import 'package:Eventune/view/screen/createEvent/customCreateEventScreen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/services.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/createEvent/AllVenueOfCategories_data.dart';

class AllVenueOfCategoriesController extends GetxController {
  MyServices myServices = Get.find();
  AllVenueOfCategoriesData allVenueOfCategoriesData =
      AllVenueOfCategoriesData(Get.find());

  ScrollController scrollController = ScrollController();

  dynamic insidedata;

  List dataList = [];
  List valuesList = [];
  Map data = {};
  Map mapData = {};
  int length = 0;
  var catiid;
  var capicty;
  int page = 1;
  bool isloadmore = false;

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
    allVenueOfCategoriesData.pagenumber = page;
    allVenueOfCategoriesData.catiid = Get.arguments['id_category'];
    allVenueOfCategoriesData.capicty = int.parse(Get.arguments['capacity']);

    var response =
        await allVenueOfCategoriesData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      print(data);
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
          // insidedata.addAll(listdata.map((e) => CreateEvent4Modale.fromJson(e)));
          length = valuesList.length; //insidedata
          print("******${valuesList}");
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }

      update();
    }
  }

  goToCustom() {
    Get.to(const CustomCreateEventScreen(), arguments: mapData);
  }

  pagination() async {
    print("xxx");
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

  @override
  void onInit() {
    getCreateEvent4();
    pagination();
    mapData = {
      'id_category': Get.arguments['id_category'],
      'name': Get.arguments['name'],
      'description': Get.arguments['description'],
      'capacity': Get.arguments['capacity'],
      'privacy': Get.arguments['privacy'],
    };
    super.onInit();
  }
}
