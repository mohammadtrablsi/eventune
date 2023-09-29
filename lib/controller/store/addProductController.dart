import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Eventune/linkapi.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/store/addProductData.dart';
import '../../data/datasource/remote/store/getAllProduct.dart';
import '../../view/screen/store/allMyStores.dart';

class AddProductController extends GetxController {
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddProductData addProductData = AddProductData(Get.find());
  GetAllProductData getAllProductData = GetAllProductData(Get.find());
  GlobalKey<AnimatedListState>? key;

  int length = 1;
  late List<List<TextEditingController>> textEditingController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]
  ];

  Map<int, List<File?>> files = {};
  List selected = [null];
  Map price = {};
  Map productIds = {};
  List products = [];
  Map selectedProduct = {};
  List type = [0];
  Map names = {};
  Map description = {};
  List<bool> isExpanded = [true];
  List<List<XFile?>> images = [[]];
  @override
  void onInit() {
    key = GlobalKey();
    getProduct();
    super.onInit();
  }

  pickMultiImage(index) async {
    images[index] = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (images[index] != null) {
      List<File?> temp = [];
      for (int i = 0; i < images[index].length; i++) {
        temp.add(File(images[index][i]!.path));
      }
      files[index] = temp;

      print('============ $files');
      update();
      Get.back();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  addProduct() {
    if (length < 20) {
      textEditingController.insert(length, [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]);
      //files
      images.insert(length, []);
      selected.insert(length, null);
      isExpanded.insert(length, false);
      type.insert(length, 0);
      //===========================
      convertControllerToText();
      //===========================
      key?.currentState!.insertItem(0, duration: const Duration(seconds: 1));
      length++;
      update();
      // print('================= ${data}');
    } else {
      return Get.defaultDialog(
          content: const Text('only you can select 5 times'));
    }
  }

  removeProduct(int index, BuildContext context) {
    if (length > 1) {
      length--;
      //data.removeAt(index);
      names.remove(index);
      type.removeAt(index);
      selected.removeAt(index);
      productIds.remove(index);
      isExpanded.removeAt(index);
      files.remove(index);
      images.removeAt(index);
      price.remove(index);
      description.remove(index);
      key?.currentState!.removeItem(0, (_, animation) {
        return const SizedBox();
      }, duration: const Duration(seconds: 1));
      update();

      // print('================= $data');
    }
  }

  convertControllerToText() {
    for (int i = 0; i < length; i++) {
      if (type[i] == 0) {
        price[i] = textEditingController[i][0].text;
        names[i] = textEditingController[i][1].text;
        description[i] = textEditingController[i][2].text;
      } else {
        //productIds[i] = selected[i];
        price[i] = textEditingController[i][0].text;
      }
    }
  }

  selectData(index, val) {
    if (val != 0) {
      type[index] = 1;
      productIds[index] = val;
      names.remove(index);
      description.remove(index);
      files.remove(index);
      print('type============= $type');
      print('names============= $names');
      print('images============= $files');
      print('description============= $description');
      print('prices============= $price');
      print('productsIds============= $productIds');
    } else {
      type[index] = 0;
      productIds.remove(index);
    }
    selected[index] = val;
    update();
  }

  next() async {
    convertControllerToText();
    print('type============= $type');
    print('names============= $names');
    print('images============= $files');
    print('description============= $description');
    print('prices============= $price');
    print('productsIds============= $productIds');

    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addProductData.addProduct(
          AppLink.token,
          productIds,
          price,
          description,
          names,
          files,
          myServices.sharedPreferences.getInt('storeId'));
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map data = {};
        data.addAll(response);
        if (data["status"] == "success") {
          print('success.....................');
          myServices.sharedPreferences.setInt('store', 1);
          Get.offAll(const AllMyStores());
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              backgroundColor: AppColor.primaryColor,
              colorText: Colors.white,
              duration: const Duration(seconds: 5));
          //next.....
        } else {
          return Get.snackbar("fail", "${data['message']}",
              colorText: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.7),
              duration: const Duration(seconds: 3));
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

  getProduct() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await getAllProductData.getAllProductData(
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
          products = data['data']['data'];
          print('=============================');
          print(data);
          print('=============================');

          products.add({'id': 0, 'name': 'Not Found'});
          products.forEach((element) {
            selectedProduct[element['id']] = element['name'];
          });
          print(selectedProduct);
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              backgroundColor: AppColor.primaryColor,
              colorText: Colors.white,
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
