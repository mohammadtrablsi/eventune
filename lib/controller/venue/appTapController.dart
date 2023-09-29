import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/venue/accepted.dart';
import '../../view/screen/venue/pending.dart';
import '../../view/screen/venue/venueProfile.dart';

class AppTapController extends GetxController {
  List<Widget> pages = [
    const VenueProfile(),
    const Pending(),
    const Accepted(),
  ];
  List<Widget> taps = [
    const Tab(
      text: 'My Venue\nProfile',
    ),
    const Tab(
      text: 'Pending\nReservations',
    ),
    const Tab(
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
    // print ("$name $latitude $description");
    // id = Get.arguments[0]['id'];
    // titles.text = title;
    // bodys.text = body;
    //print(' $body ');
    super.onInit();
  }
}
