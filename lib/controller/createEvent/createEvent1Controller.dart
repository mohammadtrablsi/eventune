import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/createEvent/getCateigoryData.dart';
import '../../view/screen/createEvent/allVenueOfCategories.dart';

class CreateEvent1Controller extends GetxController {
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GetAllCateigoryData getAllCateigoryData = GetAllCateigoryData(Get.find());
  TextEditingController nameEvent = TextEditingController();
  TextEditingController capacityEvent = TextEditingController();
  TextEditingController description = TextEditingController();

  var selected = null;
  List categorys = [];
  Map selectedCategory = {};

  @override
  void onInit() {
    print(Get.arguments['privacy']);
    formstate = GlobalKey();
    getCateigory();
    super.onInit();
  }

  next() {
    if (formstate!.currentState!.validate()) {
      Get.to(const AllVenueOfCategories(), arguments: {
        'id_category': selected,
        'name': nameEvent.text,
        'description': description.text,
        'capacity': capacityEvent.text,
        'privacy': Get.arguments['privacy']
      });
    } else {
      return Get.snackbar("warning", "Please make sure to fill out all fields",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white,
          duration: const Duration(seconds: 5));
    }
  }

  selectData(val) {
    selected = val;
    print('************* $selected');
    update();
  }

  getCateigory() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await getAllCateigoryData.getAllCateigoryData(
        AppLink.token,
      );
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map data = {};
        data.addAll(response);
        if (data["status"] == "success") {
          categorys = data['data'];
          categorys.forEach((element) {
            selectedCategory[element['id']] = element['name'];
          });
          print(selectedCategory);
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              duration: const Duration(seconds: 5));
          //next.....
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning",
            "Please make sure to fill out all fields or try again later",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    }
  }
}
