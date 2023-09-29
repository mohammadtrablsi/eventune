import 'package:get/get.dart';

class VenueProfileController extends GetxController {
  int i = 0;
  Map dataMap = {};
  late List photos;
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

  late List times;
  late List sat;
  late List sun;
  late List mon;
  late List tue;
  late List wen;
  late List thr;
  late List fri;
  foor() {
    sat = times.where((element) => element.day == 0).toList();
    sun = times.where((element) => element.day == 1).toList();
    mon = times.where((element) => element.day == 2).toList();
    tue = times.where((element) => element.day == 3).toList();
    wen = times.where((element) => element.day == 4).toList();
    thr = times.where((element) => element.day == 5).toList();
    fri = times.where((element) => element.day == 6).toList();
  }

  // var title;
  var latitude;
  var longitude;

  var description;
  var name;
  var phones;
  var id;
  // late TextEditingController titles = TextEditingController();
  // late TextEditingController bodys = TextEditingController();
  // GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    name = Get.arguments[0]['name'];
    latitude = Get.arguments[0]['latitude'];
    longitude = Get.arguments[0]['longitude'];
    description = Get.arguments[0]['description'];
    phones = Get.arguments[0]['phones'];
    id = Get.arguments[0]['id'];
    photos = Get.arguments[0]['photos'];
    times = Get.arguments[0]['times'];
    dataMap = Get.arguments[0]['data'][0];
    print("===========================================$dataMap");
    foor();
    // id = Get.arguments[0]['id'];
    // titles.text = title;
    // bodys.text = body;
    //print(' $body ');
    super.onInit();
  }
}
