import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/createEvent/getCateigoryData.dart';
import '../../data/datasource/remote/venue/updateSectionData.dart';
import '../../linkapi.dart';

class UpdateSectionController extends GetxController {
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UpdateSectionData updateSectionData = UpdateSectionData(Get.find());
  GetAllCateigoryData getAllCateigoryData = GetAllCateigoryData(Get.find());
  Map data = {};
  late Map<int, List<TextEditingController>> textEditingControllerForCateigory =
      {};
  TextEditingController? priceController;
  TextEditingController? numPersonController;
  TextEditingController? descriptionController;
  Map initiallpriceLevels1 = {};
  Map initiallpriceLevels2 = {};
  int? idSection;
  List listCateigory = [];
  List listDeletedCateigory = [];

  List<File?> files = [];
  List selectCateigory = [];
  Map selectBaseCateigory = {};
  Map selectBase1Cateigory = {};

  int? indexSelect = 0;
  Map<int, String> levels = {};
  Map<int, Map> priceLevels = {};
  String? price;
  String? desciption;
  String? numPerson;
/*
{id: 8, levels: [
{id: 22, level: l1, price: 1},
{id: 23, level: l2, price: 2},
{id: 24, level: l3, price: 100}],
category: {id: 1, name: Weddings}},
 */

  @override
  void onInit() {
    getCateigory();
    data = Get.arguments;
    desciption = data['description'].toString();
    idSection = data['id'];
    numPerson = data['capacity'].toString();
    price = data['price'].toString();

    priceController = TextEditingController(text: price.toString());
    numPersonController = TextEditingController(text: numPerson.toString());
    descriptionController = TextEditingController(text: desciption.toString());

    data['categories_pivot'].forEach((element) {
      selectCateigory.add({
        'id': element['category']['id'],
        'label': element['category']['name']
      });

      selectBaseCateigory[element['category']['id']] = 1;
      selectBase1Cateigory[element['category']['id']] = 1;

      textEditingControllerForCateigory[element['category']['id']] = [
        TextEditingController(text: element['levels'][0]['price'].toString()),
        TextEditingController(text: element['levels'][1]['price'].toString()),
        TextEditingController(text: element['levels'][2]['price'].toString()),
      ];
    });

    print(data);
    super.onInit();
  }

  void addToListOfCateigory(List newList) {
    selectCateigory = newList;
    selectCateigory.forEach((element) {
      if (selectBase1Cateigory[element['id']] != 1) {
        selectBase1Cateigory[element['id']] = 1;
        textEditingControllerForCateigory[element['id']] = [
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
        ];
      }
    });

    update();
  }

  handleDeleteCateigory() {
    Map temp = {};
    listDeletedCateigory.clear();
    //add cateigory deleted
    selectCateigory.forEach((element) {
      if (selectBaseCateigory[element['id']] == 1) {
        temp[element['id']] = 1;
      }
    });
    selectBaseCateigory.forEach((key, value) {
      if (temp[key] != 1) {
        listDeletedCateigory.add(key);
      }
    });
    //delete controlers for levels that cateigory it deleted
    print(listDeletedCateigory);

    // listDeletedCateigory.forEach((element) {
    //   print(element);
    //   textEditingControllerForCateigory[element]!.clear();
    //   print('delete textEditingControllerForCateigory. . .');
    // });
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
          var categorys = data['data'];
          categorys.forEach((element) {
            listCateigory.add({'id': element['id'], 'label': element['name']});
          });

          return Get.snackbar(
            "success",
            "The operation was completed successfully, congratulations",
          );
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

  pickMultiImage() async {
    List<XFile?> images = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        files.add(File(images[i]!.path));
      }
      print('============ $files');
      update();
      Get.back();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  next() async {
    handleDeleteCateigory();
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updateSectionData.updateSectionData(
          AppLink.token,
          desciption,
          price,
          numPerson,
          listDeletedCateigory,
          textEditingControllerForCateigory,
          selectCateigory,
          idSection);
      print("=============================== response $response ");
      print("=============================== statusRequest $statusRequest ");
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        Map data = {};
        data.addAll(response);
        if (data["status"] == "success") {
          myServices.sharedPreferences.setInt('venue', 1);
          print('success.....................');
          Get.back();
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 5));
          //next.....
        } else {
          statusRequest = StatusRequest.none;
          return Get.snackbar("warning", data['message'].toString(),
              backgroundColor: Colors.red.withOpacity(0.7),
              colorText: Colors.white,
              duration: const Duration(seconds: 3));
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning",
            "Please make sure to fill out all fields or try again later",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white,
            duration: const Duration(seconds: 3));
      }
    }
  }
}
