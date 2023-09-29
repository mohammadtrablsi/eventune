import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Eventune/data/datasource/remote/venue/addSection.dart';
import 'package:Eventune/view/screen/venue/allMyVenues.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/createEvent/getCateigoryData.dart';
import '../../linkapi.dart';

class SectonVenueController extends GetxController {
  GlobalKey<FormState>? formstate;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddSection addSections = AddSection(Get.find());
  GlobalKey<AnimatedListState>? key;
  GetAllCateigoryData getAllCateigoryData = GetAllCateigoryData(Get.find());
  List listCateigory = [];
  int idSection = 1, length = 1;
  List indexSelect = [0];
  late List<List<TextEditingController>> textEditingController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]
  ];
  late List<List<List<TextEditingController>>>
      textEditingControllerForCateigory = [
    [
      [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]
    ]
  ];
  List<List> selectCateigory = [[]];
  List<List> initialSelectCateigory = [[]];
  Map<int, Map<int, Map>> levels = {};
  Map<int, Map<int, Map>> priceLevels = {};
  List<List<File?>> files = [[]];
  List price = [null];
  List desciption = [null];
  List numPerson = [null];
  List<bool> isExpanded = [true];
  List<List<XFile?>> images = [[]];
  @override
  void onInit() {
    key = GlobalKey();
    getCateigory();
    super.onInit();
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

  pickMultiImage(indexSection) async {
    images[indexSection] = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (images[indexSection] != null) {
      for (int i = 0; i < images[indexSection].length; i++) {
        files[indexSection].add(File(images[indexSection][i]!.path));
      }
      print('============ $files');
      update();
      Get.back();
    } else {
      Get.defaultDialog(middleText: 'You must switch image');
    }
  }

  void addToListOfCateigory(index, List newList) {
    initialSelectCateigory[index] = newList;
    if (textEditingControllerForCateigory[index].isNotEmpty) {
      textEditingControllerForCateigory[index].clear();
    }
    for (int i = 0; i < newList.length; i++) {
      textEditingControllerForCateigory[index].insert(i, [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]);
    }
    update();
  }

  handleList() {
    Map<int, Map> temp = {};
    Map<int, Map> temp2 = {};

    for (int index = 0; index < length; index++) {
      for (int i = 0; i < initialSelectCateigory[index].length; i++) {
        selectCateigory[index]
            .insert(i, initialSelectCateigory[index][i]['label']);
        temp[initialSelectCateigory[index][i]['id']] = {
          0: 'l1',
          1: 'l2',
          2: 'l3'
        };
        temp2[initialSelectCateigory[index][i]['id']] = {
          0: textEditingControllerForCateigory[index][i][0].text,
          1: textEditingControllerForCateigory[index][i][1].text,
          2: textEditingControllerForCateigory[index][i][2].text,
        };
      }
      levels[index] = temp;
      priceLevels[index] = temp2;
      temp = {};
      temp2 = {};
    }
    //======
    convertControllerToText();
    //=====
    print('priceLevels $priceLevels');
    print('levels $levels');
    print('files $files');
    print('price $price');
    print('desciption $desciption');
    print('numPerson $numPerson');
  }

  addSection() {
    if (length < 5) {
      textEditingController.insert(length, [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]);
      selectCateigory.insert(length, []);
      files.insert(length, []);
      images.insert(length, []);
      isExpanded.insert(length, false);
      indexSelect.insert(length, 0);
      numPerson.insert(length, null);
      price.insert(length, null);
      desciption.insert(length, null);
      initialSelectCateigory.insert(length, []);
      textEditingControllerForCateigory.insert(length, [
        [
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
        ]
      ]);
      //===========================
//convertControllerToText();
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

  removeSection(int index, BuildContext context) {
    if (length > 1) {
      length--;
      //data.removeAt(index);
      indexSelect.removeAt(index);
      selectCateigory.removeAt(index);
      isExpanded.removeAt(index);
      files.removeAt(index);
      images.removeAt(index);
      numPerson.removeAt(index);
      price.removeAt(index);
      desciption.removeAt(index);
      initialSelectCateigory.removeAt(index);
      levels.remove(index);
      priceLevels.remove(index);
      textEditingControllerForCateigory.removeAt(index);
      key?.currentState!.removeItem(0, (_, animation) {
        return const SizedBox();
      }, duration: const Duration(seconds: 1));
      update();

      // print('================= $data');
    }
  }

  convertControllerToText() {
    for (int i = 0; i < length; i++) {
      numPerson[i] = textEditingController[i][0].text;
      price[i] = textEditingController[i][1].text;
      desciption[i] = textEditingController[i][2].text;
    }
  }

  next() async {
    if (true) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addSections.addSection(
          AppLink.token,
          desciption,
          price,
          numPerson,
          files,
          priceLevels,
          levels,
          initialSelectCateigory,
          myServices.sharedPreferences.getInt('venueId'));
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
          Get.offAll(
            const AllMyVenues(),
          );
          return Get.snackbar("success",
              "The operation was completed successfully, congratulations",
              colorText: Colors.white,
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 5));
          //next.....
        } else {
          statusRequest = StatusRequest.none;
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        return Get.snackbar("warning", "you are not online please check on it");
      } else if (statusRequest == StatusRequest.serverfailure) {
        return Get.snackbar("warning",
            "Please make sure to fill out all fields or try again later",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white,
            duration: const Duration(seconds: 5));
      }
    }
  }
}
