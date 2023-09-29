import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/createEvent/rating_data.dart';
import '../../linkapi.dart';

class StoreDetailsController extends GetxController {
  Map mapData = {};
  int i = 0;

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

  // var title;
  var latitude;

  var longitude;
  var description;
  var name;
  var phones;
  var id;
  late List photos;
  late List products;
  var numberstare = 2.5;
  // late TextEditingController titles = TextEditingController();
  // late TextEditingController bodys = TextEditingController();
  // GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //rating
  Map dataRelay = {};
  RatingData ratingData = RatingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  replay(venOrStoId, StoreOrVenue, numberOfStars) async {
    // statusRequest = StatusRequest.loading;
    ratingData.venOrStoId = venOrStoId;
    ratingData.venueOrStore = StoreOrVenue;
    ratingData.numberOfStars = numberOfStars;
    print(numberOfStars);
    // print(reqid);
    // print(resultOfReplay);
    update();
    var response = await ratingData.getsubcatigoriesdata(AppLink.token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //statusRequest = StatusRequest.success;
      dataRelay.addAll(response);
      if (dataRelay["status"] == "success") {
        Get.snackbar(dataRelay['status'], dataRelay['message']);
        update();
        // Get.back();
      } else {
        Get.snackbar(dataRelay['status'], dataRelay['message']);
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      update();
      return Get.snackbar("warning", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      update();
      return Get.snackbar("warning", "404 server faliure");
    }
    update();
  }

  numberOfStare(value) {
    numberstare = value;
  }

  late List times;
  List sat = [];
  List sun = [];
  List mon = [];
  List tue = [];
  List wen = [];
  List thr = [];
  List fri = [];
  foor() {
    for (int i = 0; i < times[0].length; i++) {
      for (int j = 0; j < times[0][i].length; j++) {
        if (times[0][i][j]['day'] == 0) {
          sat.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 1) {
          sun.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 2) {
          mon.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 3) {
          tue.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 4) {
          wen.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 5) {
          thr.add(times[0][i][j]);
        }
        if (times[0][i][j]['day'] == 6) {
          fri.add(times[0][i][j]);
        }
      }
    }
  }

  @override
  void onInit() async {
    name = Get.arguments[0]['name'];
    latitude = Get.arguments[0]['latitude'];
    longitude = Get.arguments[0]['longitude'];
    mapData = Get.arguments[0]['data'];
    description = Get.arguments[0]['description'];
    phones = Get.arguments[0]['phones'];
    id = Get.arguments[0]['id'];
    times = Get.arguments[0]['times'];
    photos = Get.arguments[0]['photos'];
    products = Get.arguments[0]['products'];
    foor();

    print(times);

    print(mapData);
    super.onInit();
  }
}
