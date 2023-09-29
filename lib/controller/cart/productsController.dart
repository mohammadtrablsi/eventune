// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';

class ProductsController extends GetxController {
  var photoOfStore;
  Map mapData = {};
  List productsSelected = [];
  late List products;
  List isSelect = [];
  var isUser;
  @override
  void onInit() {
    photoOfStore = Get.arguments[0]['photoOfStore'];
    products = Get.arguments[0]['products'];
    isUser = Get.arguments[0]['isUser'];
    mapData = Get.arguments[0]['data'];
    products.forEach((element) {
      isSelect.add(false);
    });
    super.onInit();
  }

  selectProuduct(int index) {
    productsSelected.add(products[index]);
    isSelect[index] = true;
    update();
    return Get.snackbar("alert", "Product added successfully",
        backgroundColor: AppColor.primaryColor, colorText: Colors.white);
  }

  reomveProuduct(int index) {
    productsSelected.remove(products[index]);
    isSelect[index] = false;
    update();
    return Get.snackbar("alert", "Product deleted successfully",
        backgroundColor: AppColor.primaryColor, colorText: Colors.white);
  }

  proccess(int index) {
    print(products[index]);
    if (isSelect[index]) {
      reomveProuduct(index);
    } else {
      selectProuduct(index);
    }
  }
}
