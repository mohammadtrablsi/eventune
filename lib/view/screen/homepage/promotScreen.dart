import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Eventune/controller/homepage/promoteController.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/createEvent/customDropDownButtonForCreateEvent.dart';
import '../../widget/createEvent/rowTextAndTextField.dart';

class PromotScreen extends StatelessWidget {
  const PromotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PromoteController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.iconColor,
            )),
        title: Text(
          'Promote Event',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<PromoteController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: ListView(
            children: [
              Text(
                'Decide how you want to promote :',
                style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColor.iconColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomDropDownButtonForCreateEvent(
                  hintText: 'Show as suggetion',
                  listData: const [
                    'Send notification to all user',
                    'Show as suggetion'
                  ],
                  isSelected: controller.isSelected,
                  onChanged: (val) {
                    controller.select(val);
                  }),
              controller.numMethode == 1
                  ? Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        RowTextAndTextField(
                          controller: controller.text1,
                          hintTextField: '1',
                          icon: FontAwesomeIcons.clock,
                          text: 'Number of hours will show',
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 4.h,
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomButtonForCreatEvent(
                    text: 'Promote My Event',
                    onPressed: () {
                      controller.next();
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
