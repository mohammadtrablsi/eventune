import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/class/handlingdataview.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/homepage/myWalletController.dart';
import '../../../core/constant/color.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyWalletController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.offAll(const bottomnav());
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.iconColor,
            )),
        title: Text(
          'My Wallet',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<MyWalletController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      controller.switchCard();
                    },
                    child: CreditCard(

                        cardNumber:
                            "Balance: ${controller.myWalletMapData['balance']}\$",
                        cardExpiry: "2050/1/1",
                        cardHolderName: controller.myServices.sharedPreferences
                            .getString('name'),
                        cvv: "034",
                        bankName: "EvenTune Wallet",
                        // cardType: CardType
                        //     .masterCard, // Optional if you want to override Card Type
                        showBackSide: controller.isBack,
                        frontBackground: CardBackgrounds.black,
                        backBackground: CardBackgrounds.white,
                        showShadow: controller.isBack,
                        textExpDate: 'Exp. Date',
                        textName: 'Name',
                        textExpiry: 'MM/YY'),
                  ),
                  SizedBox(height: 45.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Copyright',
                        style: TextStyle(
                          height: 1.8,
                          fontSize: AppColor.isDark == true ? 11.5.sp : 13.sp,
                          color: AppColor.iconColor,
                        ),
                      ),
                      Icon(
                        Icons.copyright_outlined,
                        size: 18.sp,
                        color: AppColor.iconColor,
                      ),
                      Text(
                        '2023 EvenTune All Right Reversed',
                        style: TextStyle(
                          height: 1.8,
                          fontSize: AppColor.isDark == true ? 11.5.sp : 13.sp,
                          color: AppColor.iconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
