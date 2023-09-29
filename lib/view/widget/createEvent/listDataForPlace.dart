import 'package:flutter/material.dart';
import 'package:Eventune/view/widget/createEvent/rowTextCreateEvent.dart';

class ListDataForPlace extends StatelessWidget {
  final String describtion;
  final String location;
  final String cost;
  final String maxNumber;

  const ListDataForPlace(
      {super.key,
      required this.describtion,
      required this.location,
      required this.cost,
      required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RowTextCreateEvent(
              text1: 'Describtion',
              text2: describtion,
            ),
            RowTextCreateEvent(
              text1: 'Location',
              text2: location,
            ),
            RowTextCreateEvent(
              text1: 'Reservation cost per a hour',
              text2: '\$ $cost',
            ),
            RowTextCreateEvent(
              text1: 'Maximum number ',
              text2: maxNumber,
            ),
          ],
        ),
      ),
    );
  }
}
