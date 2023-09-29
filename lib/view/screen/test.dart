import 'package:flutter/material.dart';

import '../../core/functions/selectPosition.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('Click'),
          onPressed: () async {
            getAddress(17.549772, -4.859199);
          },
        )
      ],
    ));
  }
}
// TextButton(
//               child: Text(_locationText),
//               onPressed: () async {
//                 LocationData? locationData = await LocationSearch.show(
//                     context: context, lightAdress: true, mode: Mode.fullscreen);

//                 setState(() {
//                   _locationText = locationData!.address;
//                 });
//               },
//             )
//=============================================================
// OpenStreetMapSearchAndPick(
//       locationPinIconColor: Colors.red,
//       center: LatLong(33.513805, 36.276527),
//       buttonColor: AppColor.primaryColor,
//       buttonText: 'Set Current Location',
//       onPicked: (pickedData) async {
//         print(pickedData.latLong.latitude);
//         print(pickedData.latLong.longitude);
//         var location = pickedData.address.split(',');

//         location.forEach((element) {
//           print(element);
//         });
//       },
//     ));