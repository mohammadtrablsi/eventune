import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/store/storesAccept.dart';
import '../../view/screen/store/storesPending.dart';
import '../../view/screen/store/storesProfile.dart';

class AppTapStoresController extends GetxController {
  List<Widget> pages = [
    const StoresProfile(),
    const StoresPending(),
    const StoresAccept(),
  ];
  List<Widget> taps = const [
    Tab(
      text: 'My Store\nProfile',
    ),
    Tab(
      text: 'Pending\nReservations',
    ),
    Tab(
      text: 'Accepted\nReservations',
    ),
  ];

  // var title;
  var latitude;
  var description;
  var name;
  var phones;
  var id;
  late List photos;
  late List times;
  // late TextEditingController titles = TextEditingController();
  // late TextEditingController bodys = TextEditingController();
  // GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    name = Get.arguments[0]['name'];
    latitude = Get.arguments[0]['latitude'];
    description = Get.arguments[0]['description'];
    phones = Get.arguments[0]['phones'];
    id = Get.arguments[0]['id'];
    photos = Get.arguments[0]['photos'];
    times = Get.arguments[0]['times'];
    // id = Get.arguments[0]['id'];
    // titles.text = title;
    // bodys.text = body;
    //print(' $body ');
    super.onInit();
  }
}
