import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/eventDetails/commentModale.dart';
import '../../data/datasource/remote/eventDetails/comment_data.dart';
import '../../data/datasource/remote/eventDetails/makeComment_data.dart';
import '../../linkapi.dart';

class ChatController extends GetxController {
  // String image = AppImageAsset.logo;
  var name;
  var images;
  var id;
  var type;
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  CommentData commentData = CommentData(Get.find());

  ScrollController scrollController = ScrollController();

  List insidedata = [];
  Map data = {};
  int length = 0;
  int page = 1;
  bool isloadmore = false;

  var token = AppLink.token;
  late TextEditingController makeCommentTextController =
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
    commentData.evid = id;
    commentData.pagenumber = page;
    commentData.type = type;
    var response = await commentData.getsubcatigoriesdata("$token");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    print(statusRequest);
    update();
    if (StatusRequest.success == statusRequest) {
      data.addAll(response);
      if (data["status"] == "success") {
        List listdata = data['data']['data'];
        //listdata =listdata.reversed.toList();
        lastpage = data['data']['last_page'];
        insidedata.addAll(listdata.map((e) => CommentModale.fromJson(e)));
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

//make comment
  Map dataRelay = {};
  MakeCommentData makeCommentData = MakeCommentData(Get.find());

  makeComment() async {
    // statusRequest = StatusRequest.loading;
    makeCommentData.evid = id;
    makeCommentData.comment = makeCommentTextController.text;
    makeCommentData.type = type;
    // print(reqid);
    // print(resultOfReplay);
    update();
    var response;
    response = await makeCommentData.send("$token");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        insidedata.insert(0, makeCommentTextController.text);
        length++;
        // insidedata.add(makeCommentTextController.text);
        makeCommentTextController.clear();
        print(insidedata);
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

  @override
  void onInit() {
    makeCommentTextController = TextEditingController();
    images = Get.arguments[0]['image'];
    name = Get.arguments[0]['name'];
    id = Get.arguments[0]['id'];
    type = Get.arguments[0]['type'];
    print(Get.arguments[0]);
    getCreateEvent4();
    pagination();
    super.onInit();
  }
}
