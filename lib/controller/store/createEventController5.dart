import 'package:get/get.dart';

class CreateEvent5Controller extends GetxController {
  var photoOfStore;
  late List products;
  var isUser;
  @override
  void onInit() {
    photoOfStore = Get.arguments[0]['photoOfStore'];
    products = Get.arguments[0]['products'];
    isUser = Get.arguments[0]['isUser'];
    super.onInit();
  }
}
