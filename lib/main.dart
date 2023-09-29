//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:Eventune/core/localization/translation.dart';
import 'package:Eventune/core/middleware/middlewareForScreen.dart';
import 'package:Eventune/routes.dart';
import 'package:Eventune/view/screen/auth/customSpalshScreen.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import 'package:Eventune/view/screen/auth/onboarding1.dart';
import 'package:Eventune/view/screen/auth/splash_screen.dart';
import 'package:Eventune/view/screen/createEvent/allVenueOfCategories.dart';
import 'package:Eventune/view/screen/createEvent/createEvent1Screen.dart';
import 'package:Eventune/view/screen/homepage/promotScreen.dart';
import 'package:Eventune/view/screen/homepage/homPage.dart';
import 'package:Eventune/view/screen/store/addStoreScreen.dart';
import 'package:Eventune/view/screen/store/allMyStores.dart';
import 'package:Eventune/view/screen/venue/addVenueScreen.dart';
import 'package:Eventune/view/screen/venue/allMyVenues.dart';
import 'package:Eventune/view/screen/venue/AddsectionVenueScreen.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:Eventune/view/test.dart';
import 'package:sizer/sizer.dart';
// import 'package:device_preview/device_preview.dart';
import 'bindings/intialbindings.dart';
import 'controller/pusher/pusherController.dart';
import 'core/functions/handlingError.dart';
import 'core/localization/changelocal.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  custumErrorScreen();
  Get.put(PusherController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        theme: controller.appTheme,
        home: const SplashScreen(),
        locale: controller.language,
        initialBinding: InitialBindings(),
        getPages: routes,
      );
    });
  }
}
