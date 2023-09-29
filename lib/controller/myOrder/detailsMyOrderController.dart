import 'package:get/get.dart';

class detailsMyOrderController extends GetxController {
  var status;
  List dataList=[];
  @override
  void onInit() {
    dataList = Get.arguments[0]['dataList'];
    status = Get.arguments[0]['status'];
    super.onInit();
  }
}
