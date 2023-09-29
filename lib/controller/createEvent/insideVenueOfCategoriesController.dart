import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';

import '../../../linkapi.dart';
import '../../core/constant/imgaeasset.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/createEvent/rating_data.dart';

class InsideVenueOfCategoriesController extends GetxController {
  List images = [AppImageAsset.logo, AppImageAsset.logo, AppImageAsset.logo];
  int i = 0;
  buttonforimages1(String type) {
    if (type == "right") {
      if (i == images.length - 1) {
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
  List sat = [];
  List sun = [];
  List mon = [];
  List tue = [];
  List wen = [];
  List thr = [];
  List fri = [];
  foor() {
    for (int i = 0; i < times.length; i++) {
      for (int j = 0; j < times[i].length; j++) {
        if (times[i][j]['day'] == 0) {
          sat.add(times[i][j]);
        }
        if (times[i][j]['day'] == 1) {
          sun.add(times[i][j]);
        }
        if (times[i][j]['day'] == 2) {
          mon.add(times[i][j]);
        }
        if (times[i][j]['day'] == 3) {
          tue.add(times[i][j]);
        }
        if (times[i][j]['day'] == 4) {
          wen.add(times[i][j]);
        }
        if (times[i][j]['day'] == 5) {
          thr.add(times[i][j]);
        }
        if (times[i][j]['day'] == 6) {
          fri.add(times[i][j]);
        }
      }
    }
  }

  // var title;
  var latitude;
  var longtude;
  var description;
  var name;
  var phones;
  var id;
  List timesList = [];
  late List photos;
  late List ListOfData;
  Map mapData = {};

  //rating
  var numberstare = 2.5;
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

  @override
  void onInit() async {
    name = Get.arguments[0]['name'];
    latitude = double.parse(Get.arguments[0]['latitude']);
    longtude = double.parse(Get.arguments[0]['longitude']);
    description = Get.arguments[0]['description'];
    phones = Get.arguments[0]['phones'];
    id = Get.arguments[0]['id'];
    photos = Get.arguments[0]['photos'];
    // timesList = Get.arguments[0]['ListOfData'][0]['times'];
    ListOfData = Get.arguments[0]['ListOfData'];
    mapData = Get.arguments[0]['data'];
    mapData['idVenue'] = id;
    times = ListOfData[0]['times'];
    print("=-=-=-= $ListOfData");
    print("=-=-=-= $times");
    print("=-=-=-= $mapData");
    foor();

    super.onInit();
  }
}
