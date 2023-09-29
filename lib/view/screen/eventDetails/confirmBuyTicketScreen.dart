import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/detailsEvent/confirmBuyTicketController.dart';
import '../../widget/eventDetails/customButtonForEventDetalis.dart';
import '../../widget/eventDetails/cardDetails.dart';
import '../../widget/eventDetails/customAppBar.dart';

class ConfirmBuyTicketScreen extends StatelessWidget {
  const ConfirmBuyTicketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ConfirmBuyTicketController());
    return GetBuilder<ConfirmBuyTicketController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 3.5.h, horizontal: 6.w),
                      child: CardDetails(
                        latitude: double.parse(
                            controller.mapData['section']['venue']['latitude']),
                        longitude: double.parse(controller.mapData['section']
                            ['venue']['longitude']),
                        dateEvent: controller.mapData['date'],
                        timeEvent:
                            '${controller.mapData['start_time']} to ${controller.mapData['period']} h',
                        location1: 'Damascus,syria',
                        location2:
                            '${controller.mapData['section']['venue']['name']} - section${controller.mapData['section']['id']}',
                        nameEvent: controller.mapData['name'],
                        priceTicket: '${controller.mapData['ticket'] ?? 0}\$',
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButtonForEventDetails(
                    text:
                        'Buy ticket ${controller.mapData['ticket'] == null ? 0 : controller.mapData['ticket']['price']}\$',
                    onPressed: () {
                      controller.buyTicket();
                    },
                  )
                ],
              ),
              //SizedBox(height:30.h,),
              CustomAppBarEventDetalis(
                numPage: 2,
                onPressedBack: () {
                  controller.backToPrevious();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
