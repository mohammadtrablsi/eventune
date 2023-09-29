import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/cart/productsController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/cart/itemOfCreateEvent5.dart';
import '../../widget/createEvent/appBarcustom.dart';
import '../../widget/createEvent/buttonInCreateEvent.dart';
import 'cartScreen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    return Scaffold(body: GetBuilder<ProductsController>(
      builder: (controller) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: AppbarCustom(text: '1058'.tr),
              ),
              SizedBox(
                height: 3.h,
              ),
              controller.mapData['hasDelivery'] == 1
                  ? Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 30.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(controller.photoOfStore),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: 75.w,
                          child: Container(
                            alignment: Alignment.center,
                            height: 5.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text('Delevery'),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                  child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  controller.products.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "no products",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : ListView.builder(
                          padding: EdgeInsetsDirectional.only(
                            top: 2.5.h,
                          ),
                          itemCount: controller.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemOfCreateEvent5(
                              name: controller.products[index].product.name,
                              price: controller.products[index].price,
                              ontap: () {
                                controller.proccess(index);
                              },
                              image: controller
                                      .products[index].product.photos.isEmpty
                                  ? AppImageAsset.nophoto
                                  : "${AppLink.imageLink}${controller.products[index].product.photos[0].path}",
                              ok: controller.isSelect[index],
                              isUser: null,
                            );
                          },
                        ),
                  controller.isUser
                      ? Container(
                          width: double.infinity,
                          padding: EdgeInsetsDirectional.only(bottom: 4.5.h),
                          child: controller.products.isEmpty
                              ? Container()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 2.h, end: 2.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ButtonInCreateEvent(
                                              widget: Row(
                                                children: [
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    '1059'.tr,
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  const Icon(
                                                    Icons.credit_card_sharp,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                ],
                                              ),
                                              onpressed: () {
                                                Get.to(
                                                  const CartScreen(),
                                                  arguments: [
                                                    {
                                                      'products': controller
                                                          .productsSelected,
                                                      'data':
                                                          controller.mapData,
                                                    }
                                                  ],
                                                );
                                              },
                                              radius: 10.0,
                                              paddinghorizontal: 9.w,
                                              paddingvertical: 4.w,
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                        )
                      : Container(),
                ],
              )),
            ],
          ),
        );
      },
    ));
  }
}
