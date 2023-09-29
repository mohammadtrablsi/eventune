import 'package:get/get.dart';

class StoreMyTimesController extends GetxController {
  int Index = 0;

  List colors = [true, false, false, false, false, false, false];
  List texts = [
    "saterday",
    "sunday",
    "monday",
    "tuesday",
    "wedisday",
    "thursday",
    "friday"
  ];
  changeColor(index) {
    colors = [false, false, false, false, false, false, false];
    colors[index] = true;
    update();
  }

  getIndex(index) {
    Index = index;
    update();
  }

  lists() {
    if (Index == 0) {
      return sat;
    } else if (Index == 1) {
      return sun;
    } else if (Index == 2) {
      return mon;
    } else if (Index == 3) {
      return tue;
    } else if (Index == 4) {
      return wen;
    } else if (Index == 5) {
      return thr;
    } else if (Index == 6) {
      return fri;
    }
  }

  late List sat;
  late List sun;
  late List mon;
  late List tue;
  late List wen;
  late List thr;
  late List fri;
  List times = [];

  @override
  void onInit() {
    sat = Get.arguments[0]['sat'];
    sun = Get.arguments[0]['sun'];
    mon = Get.arguments[0]['mon'];
    tue = Get.arguments[0]['tue'];
    wen = Get.arguments[0]['wen'];
    thr = Get.arguments[0]['thr'];
    fri = Get.arguments[0]['fri'];
    times = Get.arguments[0]['times'];
    print(times);
    // print("${sat[0]}");
    super.onInit();
  }
}
