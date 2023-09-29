import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/venue/addSectonVenueController.dart';
import '../createEvent/rowTextAndTextField.dart';

class SelectCateigoryWidget extends StatelessWidget {
  final List listCat;
  final TextEditingController priceFancyController;
  final TextEditingController priceAverageController;
  final TextEditingController priceLuxuryController;
  final void Function()? onTap;
  final int indexSession;

  const SelectCateigoryWidget({
    super.key,
    required this.listCat,
    required this.priceFancyController,
    required this.priceAverageController,
    required this.priceLuxuryController,
    this.onTap,
    required this.indexSession,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listCat.isNotEmpty
            ? SizedBox(
                width: 100.w,
                height: 5.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 2.w,
                    );
                  },
                  itemCount: listCat.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<SectonVenueController>(
                        init: Get.put(SectonVenueController()),
                        builder: (controller) {
                          return InkWell(
                            onTap: () {
                              controller.indexSelect[indexSession] = index;
                              controller.update();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 5.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.primaryColor, width: 2),
                                  color: controller.indexSelect[indexSession] ==
                                          index
                                      ? Colors.white12
                                      : AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(1.5.w)),
                              child: Text(
                                listCat[index]['label'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color:
                                        controller.indexSelect[indexSession] ==
                                                index
                                            ? AppColor.primaryColor
                                            : Colors.white,
                                    fontSize: 14.sp),
                              ),
                            ),
                          );
                        });
                  },
                ),
              )
            : const SizedBox(),
        listCat.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Now enter this section’s preparation levels :',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowTextAndTextField(
                    controller: priceLuxuryController,
                    hintTextField: '200\$',
                    icon: FontAwesomeIcons.moneyCheckDollar,
                    text: 'Luxury..',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowTextAndTextField(
                    controller: priceAverageController,
                    hintTextField: '200\$',
                    icon: FontAwesomeIcons.moneyCheckDollar,
                    text: 'Average..',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowTextAndTextField(
                    controller: priceFancyController,
                    hintTextField: '200\$',
                    icon: FontAwesomeIcons.moneyCheckDollar,
                    text: 'Fancy..',
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
