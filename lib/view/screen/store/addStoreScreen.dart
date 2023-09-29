import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Eventune/core/functions/validinput.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/store/createStoreController.dart';
import '../../../core/class/handlingdataview.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import '../../../core/constant/color.dart';
import '../../widget/createEvent/customButtonForCreateEvent.dart';
import '../../widget/createEvent/customButtonForEventDetalis.dart';
import '../../widget/createEvent/customDropDownButtonForCreateEvent.dart';
import '../../widget/venue/customTextFormFieldForCreateVenueOrStore.dart';

class AddStoreScreen extends StatelessWidget {
  const AddStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateStoreController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(const bottomnav());
                },
                icon: Icon(Icons.arrow_back,
                    size: 20.sp, color: AppColor.iconColor)),
            Text(
              'Create Store',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<CreateStoreController>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: ListView(
                    children: [
                      Text(
                        'Now enter the store information :',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Form(
                        key: controller.formstate,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 0.2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextFormFieldForCreateVenueOrStore(
                                  validator: (val) {
                                    return vaildator(val!, 3, 50, 'username');
                                  },
                                  text: 'Store\'s name',
                                  controller: controller.venueName!),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomTextFormFieldForCreateVenueOrStore(
                                  validator: (val) {
                                    return vaildator(val!, 7, 50, 'phone');
                                  },
                                  text: 'phone number',
                                  controller: controller.numberPhone!),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomTextFormFieldForCreateVenueOrStore(
                                  validator: (val) {
                                    return vaildator(val!, 3, 150, 'else');
                                  },
                                  text: 'description',
                                  controller: controller.description!,
                                  isExpanded: true),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomDropDownButtonForCreateEvent(
                                  hintText: 'Serves Delivery',
                                  listData: const [
                                    'Yes,we have Serves Delivery',
                                    'No,we not haveF Serves Delivery'
                                  ],
                                  isSelected: controller.isSelected,
                                  onChanged: (val) {
                                    controller
                                        .selectifServeceDeliveryOrNot(val);
                                  }),
                              controller.isDelivery
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        CustomTextFormFieldForCreateVenueOrStore(
                                            validator: (val) {
                                              return vaildator(
                                                  val!, 2, 50, 'else');
                                            },
                                            text: 'Cost delivery',
                                            controller:
                                                controller.priceDelivery!),
                                      ],
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomButtomForCreateEvent(
                                  icon: FontAwesomeIcons.locationDot,
                                  text: 'Location',
                                  onPressed: () {
                                    try {
                                      Get.bottomSheet(Container(
                                        height: 90.h,
                                        width: 100.w,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(2.w))),
                                        child: OpenStreetMapSearchAndPick(
                                          locationPinIconColor: Colors.red,
                                          center: LatLong(33.513805, 36.276527),
                                          buttonColor: AppColor.primaryColor,
                                          buttonText: 'Set Current Location',
                                          onPicked: (pickedData) async {
                                            controller.pickLocation(
                                                pickedData.latLong.longitude,
                                                pickedData.latLong.latitude);
                                            var location =
                                                pickedData.address.split(',');
                                            for (var element in location) {
                                              print(element);
                                            }
                                            Get.back();
                                          },
                                        ),
                                      ));
                                    } catch (e) {
                                      print('Error in map $e');
                                    }
                                  }),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomButtomForCreateEvent(
                                  icon: FontAwesomeIcons.fileImage,
                                  text: 'Attach image',
                                  onPressed: () {
                                    controller.pickMultiImage();

                                    //controller.pickImage(ImageSource.gallery);
                                  }),
                              SizedBox(
                                height: 3.h,
                              ),
                              CustomButtonForCreatEvent(
                                  text: 'Next',
                                  onPressed: () {
                                    controller.next();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Padding(
                //     padding:
                //         EdgeInsets.only(bottom: 3.h, left: 5.w, right: 5.w),
                //     child: CustomButtonForCreatEvent(
                //         text: 'Next',
                //         onPressed: () {
                //           controller.next();
                //         }),
                //   ),
                // ),
              ],
            ));
      }),
    );
  }
}
