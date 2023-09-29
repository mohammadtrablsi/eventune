import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/store/updateStoreData.dart';

class UpdateStoreController extends GetxController {
  TextEditingController? storeName;
  TextEditingController? numberPhone;
  TextEditingController? description;
  double longitude = 0.0, latitude = 0.0;
  int? venueId;
  Map data = {};
  Map dataMap = {};

  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UpdateStoreData updateStoreData = UpdateStoreData(Get.find());

  /*
  
  
  {id: 2, user_id: 2, name: venue1, description: lap lap lp, longitude: 500, latitude: 200, rate: 0, 
  photos: [{id: 10, path: venue/CPeJzFFf7OgWpr2hXA3vWbpHa4NWpESsZZs9KbUl.jpg}],
  phones: [{id: 2, phone_number: 0973284723}],
 }
  
  
   */
  @override
  void onInit() {
    dataMap = Get.arguments;
    print(dataMap);
    storeName = TextEditingController(text: dataMap['name']);
    venueId = dataMap['id'];
    numberPhone =
        TextEditingController(text: dataMap['phones'][0]['phone_number']);
    description = TextEditingController(text: dataMap['description']);

    formstate = GlobalKey<FormState>();

    super.onInit();
  }

  void pickLocation(lon, lat) {
    longitude = lon;
    latitude = lat;
  }

  next() async {
    if (formstate!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updateStoreData.updateStoreData(
          AppLink.token,
          storeName!.text != dataMap['name'] ? storeName!.text : null,
          description!.text != dataMap['description']
              ? description!.text
              : null,
          longitude != dataMap['longitude'] ? longitude : null,
          longitude != dataMap['latitude'] ? latitude : null,
          numberPhone!.text != dataMap['phones'][0]['phone_number']
              ? numberPhone?.text
              : null,
          venueId);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        data.addAll(response);
        if (data["status"] == "success") {
          Get.back();
          return Get.snackbar("success",
              "${data['message']}\nPlease wait for approval by the admin",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 5));
        } else {
          return Get.snackbar("fail", "${data['message']}",
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning", "please again later",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    }
  }
}
