import 'package:get/get.dart';
import 'package:Eventune/core/services/services.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import 'package:Eventune/view/screen/store/addProductScreen.dart';
import 'package:Eventune/view/screen/venue/addVenueScreen.dart';
import 'package:Eventune/view/screen/venue/AddsectionVenueScreen.dart';
import 'package:Eventune/view/screen/venue/selectAvailableTimeScreen.dart';

import '../../view/screen/auth/onboarding1.dart';
import '../../view/screen/store/addStoreScreen.dart';
import '../../view/screen/homepage/bottomnav.dart';
import '../../view/widget/store/detailsVenueOrStoreScreen.dart';

MyServices myServices = Get.find();
venueMiddleWare() {
  myServices.sharedPreferences.setString('type', 'venue');
  if (myServices.sharedPreferences.getInt('venue') == 1 ||
      myServices.sharedPreferences.getInt('venue') == null) {
    return const AddVenueScreen();
  } else if (myServices.sharedPreferences.getInt('venue') == 2) {
    return const DetailsVenueOrStoreScreen();
  } else if (myServices.sharedPreferences.getInt('venue') == 3) {
    return const SelectAvailableTimeScreen();
  } else if (myServices.sharedPreferences.getInt('venue') == 4) {
    return const SectionVenueScreen();
  }
}

storeMiddleWare() {
  myServices.sharedPreferences.setString('type', 'store');
  if (myServices.sharedPreferences.getInt('store') == 1 ||
      myServices.sharedPreferences.getInt('store') == null) {
    return const AddStoreScreen();
  } else if (myServices.sharedPreferences.getInt('store') == 2) {
    return const DetailsVenueOrStoreScreen();
  } else if (myServices.sharedPreferences.getInt('store') == 3) {
    return const SelectAvailableTimeScreen();
  } else if (myServices.sharedPreferences.getInt('store') == 4) {
    return const AddProductScreen();
  }
}

eventMiddleWare() {
  if (myServices.sharedPreferences.getInt('store') == 1) {
    return const AddStoreScreen();
  } else if (myServices.sharedPreferences.getInt('store') == 2) {
    return const SelectAvailableTimeScreen();
  } else {
    return const AddProductScreen();
  }
}

authMiddleWare() {
    if (myServices.sharedPreferences.getInt('auth') == 2) {
    //homePage
    return const bottomnav();
  } else {
    //onboarding
    return const Onboarding();
  }
}
