import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/auth/onboardingcontroller.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/onBoarding/onboardingbutton.dart';
import '../../widget/onBoarding/onboardingcircle.dart';
import '../../widget/onBoarding/onboardingimage.dart';
import '../../widget/onBoarding/onboardingtext.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardingcontroller());
    return Scaffold(
        body: GetBuilder<Onboardingcontroller>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView(
                onPageChanged: ((value) {
                  controller.setindex(value);
                }),
                controller: controller.pagecontroller,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        const Onboardingimage(
                          image: AppImageAsset.onboarding2,
                          height: 36,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        onboardingtext(
                          text: '1001'.tr,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        const Onboardingimage(
                          image: AppImageAsset.onboarding1,
                          height: 32,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        onboardingtext(
                          text: '1002'.tr,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        const Onboardingimage(
                          image: AppImageAsset.onboarding3,
                          height: 36,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        onboardingtext(
                          text: '1003'.tr,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  const onboardingcircle(),
                  SizedBox(
                    height: 7.h,
                  ),
                  onboardingbutton(
                    text: 'Continue',
                    transport: () {
                      controller.transport();
                    },
                    index: controller.indexpage,
                    go_to_register: () => controller.gotoregister(),
                    skip: () => controller.skip(),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
