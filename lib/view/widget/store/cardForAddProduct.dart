import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Eventune/view/widget/store/customDropDownButtonForStore.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/store/addProductController.dart';
import '../../../core/constant/color.dart';
import '../createEvent/customButtonForCreateEvent.dart';
import '../createEvent/customTextFormFieldForCreateEvent.dart';
import '../createEvent/rowTextAndTextField.dart';

class CardForAddProduct extends StatelessWidget {
  final int length;
  final int numProduct;
  final bool initiallyExpanded;
  final void Function()? onPressedPickImage;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final List product;
  final void Function(bool)? onExpansionChanged;
  final Animation<double> animation;
  final void Function(DismissDirection)? onDismissed;
  const CardForAddProduct(
      {super.key,
      required this.numProduct,
      this.onPressedPickImage,
      required this.nameController,
      required this.product,
      required this.animation,
      required this.length,
      this.onDismissed,
      required this.initiallyExpanded,
      required this.onExpansionChanged,
      required this.priceController,
      required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return length > 1
        ? Dismissible(
            background:
                Container(margin: EdgeInsets.all(0.6.h), color: Colors.red),
            key: UniqueKey(),
            onDismissed: onDismissed,
            child: CustomCardForAddProduct(
              initiallyExpanded: initiallyExpanded,
              animation: animation,
              onPressedPickImage: onPressedPickImage,
              descriptionController: descriptionController,
              priceController: priceController,
              nameController: nameController,
              numProduct: numProduct,
              product: product,
              onExpansionChanged: onExpansionChanged,
            ))
        : CustomCardForAddProduct(
            initiallyExpanded: initiallyExpanded,
            animation: animation,
            onPressedPickImage: onPressedPickImage,
            descriptionController: descriptionController,
            priceController: priceController,
            nameController: nameController,
            numProduct: numProduct,
            product: product,
            onExpansionChanged: onExpansionChanged,
          );
  }
}

class CustomCardForAddProduct extends StatelessWidget {
  final int numProduct;
  final void Function()? onPressedPickImage;
  final bool initiallyExpanded;
  final void Function(bool)? onExpansionChanged;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final List product;
  final Animation<double> animation;
  const CustomCardForAddProduct(
      {super.key,
      required this.numProduct,
      this.onPressedPickImage,
      required this.nameController,
      required this.product,
      required this.animation,
      required this.initiallyExpanded,
      this.onExpansionChanged,
      required this.descriptionController,
      required this.priceController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddProductController(),
        builder: (controller) {
          return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    child: ExpansionTile(
                      onExpansionChanged: onExpansionChanged,
                      initiallyExpanded: initiallyExpanded,
                      title: Text(
                        'product ${numProduct + 1}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.black,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      collapsedBackgroundColor: AppColor.primaryColor,
                      shape: Border.all(width: 2, color: Colors.black12),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Enter your products details :',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomDropDownButtonForProduct(
                                hintText: (controller.selected[numProduct] ==
                                        null)
                                    ? 'Select product'
                                    : (controller.selected[numProduct] == 0)
                                        ? 'Not Found'
                                        : controller.selectedProduct[
                                            controller.selected[numProduct]],
                                listData: product,
                                onChanged: (val) {
                                  controller.selectData(numProduct, val);
                                },
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              RowTextAndTextField(
                                controller: priceController,
                                hintTextField: '200',
                                icon: FontAwesomeIcons.moneyBill,
                                text: 'Price',
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              (controller.selected[numProduct] == null ||
                                      controller.selected[numProduct] == 0)
                                  ? Column(
                                      children: [
                                        CustomButtomForCreateEvent(
                                            icon: FontAwesomeIcons.fileImage,
                                            text: 'Attach image',
                                            onPressed: onPressedPickImage),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        SizedBox(
                                          child:
                                              CustomTextFormFieldForCreateEvent(
                                                  text: 'Name',
                                                  controller: nameController),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        SizedBox(
                                          child:
                                              CustomTextFormFieldForCreateEvent(
                                                  text: 'Description',
                                                  controller:
                                                      descriptionController),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: 1.5.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )));
        });
  }
}
