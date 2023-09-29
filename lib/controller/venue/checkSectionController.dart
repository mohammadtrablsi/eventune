import 'package:get/get.dart';

// ignore: camel_case_types
class checkSectionController extends GetxController {
  late List photos;
  int Index = 0;

  bool check1 = true;

  bool check2 = false;

  bool check3 = true;
  int i = 0;

  getIndex(index) {
    Index = index;
    print(Index);
    update();
  }

  buttonforimages(String type) {
    if (type == "right") {
      if (i == photos.length - 1) {
        i = i;
      } else {
        i += 1;
      }
      update();
    } else {
      if (i == 0) {
        i = i;
      } else {
        i -= 1;
      }
      update();
    }
  }

  docheckbox(value) {
    if (value == "check1") {
      check1 = !check1;
      update();
    } else if (value == "check2") {
      check2 = !check2;
      update();
    } else {
      check3 = !check3;
      update();
    }
  }

  late List categoriesPivot;
  Map data = {};
  var description;
  var price;
  var capicty;
  var name;
  @override
  void onInit() {
    description = Get.arguments[0]['description'];
    price = Get.arguments[0]['price'];
    capicty = Get.arguments[0]['capicty'];
    photos = Get.arguments[0]['photos'];
    categoriesPivot = Get.arguments[0]['categoriesPivot'];
    name = Get.arguments[0]['name'];
    data = Get.arguments[0]['data'];
    print(Get.arguments[0]['data']);
    super.onInit();
  }
}
