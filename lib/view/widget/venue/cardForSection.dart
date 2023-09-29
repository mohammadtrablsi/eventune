import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Eventune/view/widget/venue/customDropDownButtonForSectionVenue.dart';
import 'package:Eventune/view/widget/venue/selectCateigory.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../createEvent/customButtonForCreateEvent.dart';
import '../createEvent/customTextFormFieldForCreateEvent.dart';
import '../createEvent/rowTextAndTextField.dart';

class CardForSection extends StatelessWidget {
  final int length;
  final int numSection;
  final bool initiallyExpanded;
  final void Function()? onPressedPickImage;
  final TextEditingController numPersonController;
  final TextEditingController priceLuxuryController;
  final TextEditingController priceFancyController;
  final TextEditingController priceAverageController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final List listofCateigory;
  final List initiallySelected;
  final void Function(bool)? onExpansionChanged;
  final Animation<double> animation;
  final void Function(List<dynamic>) onChangedNewList;
  final void Function(DismissDirection)? onDismissed;
  const CardForSection(
      {super.key,
      required this.numSection,
      this.onPressedPickImage,
      required this.numPersonController,
      required this.priceLuxuryController,
      required this.priceFancyController,
      required this.priceAverageController,
      required this.listofCateigory,
      required this.onChangedNewList,
      required this.animation,
      required this.length,
      this.onDismissed,
      required this.initiallySelected,
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
            child: CustomCardForSection(
              onExpansionChanged: onExpansionChanged,
              animation: animation,
              initiallyExpanded: initiallyExpanded,
              listofCateigory: listofCateigory,
              numPersonController: numPersonController,
              numSection: numSection,
              onChangedNewList: onChangedNewList,
              priceAverageController: priceAverageController,
              priceFancyController: priceFancyController,
              priceLuxuryController: priceLuxuryController,
              onPressedPickImage: onPressedPickImage,
              initiallySelected: initiallySelected,
              descriptionController: descriptionController,
              priceController: priceController,
            ))
        : CustomCardForSection(
            initiallyExpanded: initiallyExpanded,
            animation: animation,
            listofCateigory: listofCateigory,
            numPersonController: numPersonController,
            numSection: numSection,
            onChangedNewList: onChangedNewList,
            priceAverageController: priceAverageController,
            priceFancyController: priceFancyController,
            priceLuxuryController: priceLuxuryController,
            onPressedPickImage: onPressedPickImage,
            initiallySelected: initiallySelected,
            descriptionController: descriptionController,
            priceController: priceController,
          );
  }
}

class CustomCardForSection extends StatelessWidget {
  final int numSection;
  final void Function()? onPressedPickImage;
  final List initiallySelected;
  final bool initiallyExpanded;
  final void Function(bool)? onExpansionChanged;
  final TextEditingController numPersonController;
  final TextEditingController priceLuxuryController;
  final TextEditingController priceFancyController;
  final TextEditingController priceAverageController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;

  final List listofCateigory;
  final Animation<double> animation;
  final void Function(List<dynamic>) onChangedNewList;
  const CustomCardForSection(
      {super.key,
      required this.numSection,
      this.onPressedPickImage,
      required this.numPersonController,
      required this.priceLuxuryController,
      required this.priceFancyController,
      required this.priceAverageController,
      required this.listofCateigory,
      required this.onChangedNewList,
      required this.animation,
      required this.initiallySelected,
      required this.initiallyExpanded,
      this.onExpansionChanged,
      required this.descriptionController,
      required this.priceController});

  @override
  Widget build(BuildContext context) {
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
                  'Section $numSection',
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
                          'Enter your venue sections details :',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomButtomForCreateEvent(
                            icon: FontAwesomeIcons.fileImage,
                            text: 'Attach image',
                            onPressed: onPressedPickImage),
                        SizedBox(
                          height: 3.h,
                        ),
                        RowTextAndTextField(
                          controller: numPersonController,
                          hintTextField: '200',
                          icon: FontAwesomeIcons.peopleGroup,
                          text: 'Number from presons',
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
                        SizedBox(
                          child: CustomTextFormFieldForCreateEvent(
                              text: 'Description',
                              controller: descriptionController),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomDropDownButtonForSectionVenue(
                            initiallySelected: initiallySelected,
                            listData: listofCateigory,
                            onChanged: onChangedNewList),
                        SizedBox(
                          height: 3.h,
                        ),
                        SelectCateigoryWidget(
                          //indexSelect: control,
                          listCat: initiallySelected,
                          priceAverageController: priceAverageController,
                          priceFancyController: priceFancyController,
                          priceLuxuryController: priceLuxuryController,
                          indexSession: numSection - 1,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
