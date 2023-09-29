import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homepage/bottomnavcontroller.dart';
import 'drawerOfApp.dart';
import '../../widget/homepage/apearTwoButtons.dart';
import '../../widget/homepage/bottomNavOfApp.dart';

class bottomnav extends StatelessWidget {
  const bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Bottomnavcontroller());
    return GetBuilder<Bottomnavcontroller>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldkey,
          drawer: const DrawerOfApp(),
          floatingActionButton:
              !controller.isPressed ? const ApearTwoButtons() : null,
          bottomNavigationBar: const BottomNavOfApp(),
          body: controller.Listpage.elementAt(controller.currentpage),
        );
      },
    );
  }
}
