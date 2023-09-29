import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../linkapi.dart';
import '../../../controller/myOrder/detailsMyOrderController.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/myOrder/cardForProduct.dart';
import '../../widget/myOrder/rowState.dart';

class DetailsOrderScreen extends StatelessWidget {
  const DetailsOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(detailsMyOrderController());
    return Scaffold(
      body: GetBuilder<detailsMyOrderController>(builder: (controller) {
        return Column(
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 2.h, top: 5.h, bottom: 2.h),
              child: const AppbarCustom(
                text: 'My Orders details',
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 2.h, start: 3.5.h, end: 3.5.h, bottom: 2.h),
              child: RowState(
                numState: controller.status == "accepted"
                    ? 2
                    : controller.status == "pending"
                        ? 1
                        : controller.status == "rejected"
                            ? 3
                            : 0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      return CardForProduct(
                        imageUrl: controller
                                .dataList[index].product.photos!.isEmpty
                            ? AppImageAsset.nophoto
                            : "${AppLink.imageLink}${controller.dataList[index].product.photos![0].path}",
                        text: [
                          '${controller.dataList[index].product.name}',
                          '${controller.dataList[index].pivot.quantity}',
                          '${controller.dataList[index].price} \$'
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 3.h,
                      );
                    },
                    itemCount: controller.dataList.length),
              ),
            )
          ],
        );
      }),
    );
  }
}
