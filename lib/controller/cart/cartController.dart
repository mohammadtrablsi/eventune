import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/functions/alert.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/addOrder.dart';
import '../../linkapi.dart';
import '../../view/screen/homepage/bottomnav.dart';

class CartController extends GetxController {
  int total = 0, subTotal = 0, shoppingCost = 10;
  double? longitude = -1, latitude = -1;
  List product = [];
  Map mapData = {};
  List ids = [];
  List quantity = [];
  int length = 0;
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddOrderData addOrderData = AddOrderData(Get.find());
  TextEditingController passowrd = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    product = Get.arguments[0]['products'];
    mapData = Get.arguments[0]['data'];
    print('Map of Data =========================');
    print(mapData);
    if (mapData['type'] == 'c') {
      latitude = mapData['latitude'];
      longitude = mapData['longitude'];
    }
    length = product.length;
    product.forEach((element) {
      ids.add(element.id);
      quantity.add(1);
      subTotal = subTotal + element.price as int;
    });
    total = subTotal + shoppingCost;
    super.onInit();
  }

  checkout() {
    alert(() async {
      if (true) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await addOrderData.addOrderData(
            AppLink.token,
            passowrd.text,
            mapData['id'].toString(),
            ids,
            quantity,
            mapData['date'],
            mapData['time'],
            mapData['hasDelivery'],
            longitude,
            latitude,
            mapData['venueId']);
        print("=============================== response $response ");
        print("=============================== statusRequest $statusRequest ");
        statusRequest = handlingData(response);
        update();
        if (StatusRequest.success == statusRequest) {
          Map data = {};
          data.addAll(response);
          if (data["status"] == "success") {
            print('success.....................');
            Get.back();
            Get.offAll(const bottomnav());
            return Get.snackbar(
                backgroundColor: AppColor.primaryColor,
                colorText: Colors.white,
                "success",
                "The operation was successful and good luck",
                duration: const Duration(seconds: 5));
            //next.....
          } else {
            return Get.snackbar("warning",
                "${data['message']} or please again later in auther time",
                duration: const Duration(seconds: 5),
                backgroundColor: Colors.red.withOpacity(0.7),
                colorText: Colors.white);
          }
        } else if (statusRequest == StatusRequest.offlinefailure) {
          return Get.snackbar(
              "warning", "you are not online please check on it",
              duration: const Duration(seconds: 5));
        } else if (statusRequest == StatusRequest.serverfailure) {
          return Get.snackbar("warning", "please again later",
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.red.withOpacity(0.7),
              colorText: Colors.white);
        }
      }
      Get.back();
    }, 'This transaction needs to be paid if you confirm that you may lose your money and in case the operation fails you will be refunded',
        passowrd);
  }

  deleteFromCart(int index) {
    subTotal -= quantity[index] * product[index].price as int;
    total -= quantity[index] * product[index].price as int;
    quantity.removeAt(index);
    ids.removeAt(index);
    length--;
    update();
  }

  increaseQuantity(int index) {
    quantity[index]++;
    total += product[index].price as int;
    subTotal += product[index].price as int;
    update();
  }

  decreaseQuantity(int index) {
    if (quantity[index] > 1) {
      quantity[index]--;
      subTotal -= product[index].price as int;
      total -= product[index].price as int;
      update();
    } else {
      return Get.snackbar("alert", "Can\'t to quantity that less than  1",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  goToBack() {}
  goToMap() {}
}
