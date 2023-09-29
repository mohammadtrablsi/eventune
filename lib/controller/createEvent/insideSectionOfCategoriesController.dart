import 'package:get/get.dart';
import '../../view/screen/createEvent/imagesAndPaidScreen.dart';

class InsideSectionOfCategoriesController extends GetxController {
  int Index = 0;
  int i = 0;
  Map mapData = {};

  getIndex(index) {
    Index = index;
    update();
  }

  buttonforimages(String type) {
    if (type == "right") {
      if (i == MapOfData['photos'].length - 1) {
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

  goToScheduleTime(bool equpement, levelId) {
    if (equpement) {
      Get.offAll(const ImagesAndPaidScreen(), arguments: {
        'id_category': mapData['id_category'],
        'id_section': MapOfData['id'],
        'name': mapData['name'],
        'description': mapData['description'],
        'capacity': mapData['capacity'],
        'privacy': mapData['privacy'],
        'equpement': 1,
        'levelId': levelId,
        'venueId': mapData['idVenue'],
        'type': 'p'
      });
    } else {
      Get.offAll(const ImagesAndPaidScreen(), arguments: {
        'id_category': mapData['id_category'],
        'name': mapData['name'],
        'description': mapData['description'],
        'capacity': mapData['capacity'],
        'privacy': mapData['privacy'],
        'equpement': 0,
        'venueId': mapData['idVenue'],
        'id_section': MapOfData['id'],
        'type': 'p'
      });
    }
  }

  var name;
  late dynamic MapOfData;
  @override
  void onInit() {
    MapOfData = Get.arguments[0]['MapOfData'];
    mapData = Get.arguments[0]['data'];
    name = Get.arguments[0]['name'];
    print('*************************${MapOfData['id']}');
    print(mapData);
    super.onInit();
  }
}
