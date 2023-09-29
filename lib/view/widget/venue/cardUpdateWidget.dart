import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Eventune/core/constant/color.dart';
import 'package:Eventune/view/widget/createEvent/rowTextAndTextFieldForUpdate.dart';
import 'package:Eventune/view/widget/venue/selectCateigoryForSection.dart';
import 'package:sizer/sizer.dart';
import '../createEvent/CustomTextFormFieldForUpdateSection.dart';
import '../createEvent/customButtonForCreateEvent.dart';
import 'customDropDownButtonForSectionVenue.dart';

class CardUpdateSection extends StatelessWidget {
  final void Function()? onPressedPickImage;
  final List initiallySelectedForCateigory;

  final TextEditingController numPersonController;
  final TextEditingController priceLuxuryController;
  final TextEditingController priceFancyController;
  final TextEditingController priceAverageController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final List listofCateigory;
  final void Function(List<dynamic>) onChangedNewList;

  const CardUpdateSection({
    super.key,
    this.onPressedPickImage,
    required this.initiallySelectedForCateigory,
    required this.numPersonController,
    required this.priceLuxuryController,
    required this.priceFancyController,
    required this.priceAverageController,
    required this.descriptionController,
    required this.priceController,
    required this.listofCateigory,
    required this.onChangedNewList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your venue sections details :',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.iconColor,
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
            RowTextAndTextFieldForUpdate(
              controller: numPersonController,
              hintTextField: '200',
              icon: FontAwesomeIcons.peopleGroup,
              text: 'Number from presons',
            ),
            SizedBox(
              height: 3.h,
            ),
            RowTextAndTextFieldForUpdate(
              controller: priceController,
              hintTextField: '200',
              icon: FontAwesomeIcons.moneyBill,
              text: 'Price',
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              child: CustomTextFormFieldForUpdateSection(
                text: 'Description',
                controller: descriptionController,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomDropDownButtonForSectionVenue(
                initiallySelected: initiallySelectedForCateigory,
                listData: listofCateigory,
                onChanged: onChangedNewList),
            SizedBox(
              height: 3.h,
            ),
            SelectCateigoryForSection(
              listCat: initiallySelectedForCateigory,
              priceAverageController: priceAverageController,
              priceFancyController: priceFancyController,
              priceLuxuryController: priceLuxuryController,
              indexSession: 0,
            ),
            SizedBox(
              height: 1.5.h,
            ),
          ],
        ));
  }
}
