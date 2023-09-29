import 'package:get/get.dart';

class AllSectionOfVenueOfCategoriesController extends GetxController {
  late List ListOfData;
  Map mapData = {};
  var name;

  @override
  void onInit() {
    ListOfData = Get.arguments[0]['ListOfData'];
    name = Get.arguments[0]['name'];
    mapData = Get.arguments[0]['data'];

    print('================= $ListOfData ');
    super.onInit();
  }
}
