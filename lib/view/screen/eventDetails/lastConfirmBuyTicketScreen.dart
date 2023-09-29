import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/detailsEvent/lastConfirmBuyTicketController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/eventDetails/customButtonForEventDetalis.dart';
class LastConfirmBuyTicket extends StatelessWidget {
  const LastConfirmBuyTicket({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LastConfirmBuyTicketController());
    return GetBuilder<LastConfirmBuyTicketController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppImageAsset.eventDetails, fit: BoxFit.cover),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 6.w,),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child:  Text(
                            'Congrats you have bough\nthe ticket',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(height: 4.h,),
                      Padding(
                        padding:  EdgeInsets.only(top:3.h),
                        child: CustomButtonForEventDetails(
                          text: 'Go Back',
                          onPressed: (){
                            controller.next();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
