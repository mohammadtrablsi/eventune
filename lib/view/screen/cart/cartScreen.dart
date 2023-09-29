import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:Eventune/core/class/handlingdataview.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/cart/cartController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../linkapi.dart';
import '../../widget/cart/columnDeliveryAddressDetails.dart';
import '../../widget/cart/columnForTitleAndPriceAndquantityAndDelete.dart';
import '../../widget/cart/columnOrderDetails.dart';
import '../../widget/cart/customCardForCart.dart';
import '../../widget/cart/doubleContainerForImage.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon:
                Icon(Icons.arrow_back, size: 20.sp, color: AppColor.iconColor)),
        title: Text(
          'Cart',
          style: TextStyle(
              fontSize: 17.sp,
              color: AppColor.iconColor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 35.h,
                        width: 100.w,
                        child: controller.length != 0
                            ? ListView.separated(
                                itemBuilder: (context, index) {
                                  return CustomCardForCart(
                                    child: Row(children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      DoubleContainerForImage(
                                        imageUrl: controller.product[index]
                                                .product.photos.isEmpty
                                            ? AppImageAsset.nophoto
                                            : "${AppLink.imageLink}${controller.product[index].product.photos[0].path}",
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.5.h, horizontal: 2.w),
                                          child:
                                              ColumnForTitleAndPriceAndquantityAndDelete(
                                                  price: controller
                                                      .product[index].price
                                                      .toString(),
                                                  quantity: controller
                                                      .quantity[index]
                                                      .toString(),
                                                  title: controller
                                                      .product[index]
                                                      .product
                                                      .name,
                                                  onTapIncrease: () {
                                                    controller.increaseQuantity(
                                                        index);
                                                  },
                                                  onTapDecrease: () {
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                  onTapDelete: () {
                                                    controller
                                                        .deleteFromCart(index);
                                                  }),
                                        ),
                                      ),
                                    ]),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 1.5.h,
                                  );
                                },
                                itemCount: controller.length)
                            : Center(
                                child: Text(
                                'No Product',
                                style: TextStyle(fontSize: 20.sp),
                              )),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      controller.mapData['hasDelivery'] == 1
                          ? ColumnDeliveryAddressDetails(
                              imageUrl:
                                  'http://www.newdesignfile.com/postpic/2015/01/map-icons-markers_20960.png',
                              location: '',
                              latitude: controller.latitude!,
                              longitude: controller.longitude!,
                              ok: controller.latitude != -1 &&
                                  controller.longitude != -1,
                              onTapForGoToMap: () {
                                try {
                                  Get.bottomSheet(Container(
                                    height: 90.h,
                                    width: 100.w,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(2.w))),
                                    child: OpenStreetMapSearchAndPick(
                                      locationPinIconColor: Colors.red,
                                      center: LatLong(33.513805, 36.276527),
                                      buttonColor: AppColor.primaryColor,
                                      buttonText: 'Set Current Location',
                                      onPicked: (pickedData) async {
                                        controller.longitude =
                                            pickedData.latLong.longitude;
                                        controller.latitude =
                                            pickedData.latLong.latitude;
                                        controller.update();
                                        Get.back();
                                      },
                                    ),
                                  ));
                                } catch (e) {
                                  print('Error in map $e');
                                }
                                controller.update();
                              },
                            )
                          : const ColumnDeliveryAddressDetails2(
                              imageUrl:
                                  'http://www.newdesignfile.com/postpic/2015/01/map-icons-markers_20960.png',
                            ),
                      SizedBox(
                        height: 3.h,
                      ),
                      ColumnOrderDetails(
                        subTotalPrice: controller.subTotal.toString(),
                        shoppingCost: controller.shoppingCost.toString(),
                        totalPrice: controller.total.toString(),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(3.h),
                      child: CustomButtonForCreatEvent(
                          text: 'Checkout',
                          onPressed: () {
                            controller.checkout();
                          }),
                    )),
              ],
            ));
      }),
    );
  }
}
