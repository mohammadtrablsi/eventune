import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

// import 'package:maps_launcher/maps_launcher.dart';

class MapApp extends StatefulWidget {
  const MapApp({super.key});

  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  LatLng point = LatLng(33.513805, 36.276527);
  late List<Placemark> location;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: ElevatedButton(
              onPressed: () async {
                
              },
              child: Text('Click')),
        )
      ],
    ));
  }
}
// FlutterMap(
//         options: MapOptions(
//           center: point,
//           zoom: 3,
//           onTap: (tapPosition, p) async {
//             location =
//                 await placemarkFromCoordinates(p.latitude, p.longitude);
//             setState(() {
//               point = p;
//               print(p);
//             });

//             print(
//                 "${location[0].country} - ${location[0].administrativeArea} - ${location[0].locality}");
//           },
//         ),
//         nonRotatedChildren: const [
//           // SimpleAttributionWidget(
//           //   source: Text('OpenStreetMap contributors'),
//           // ),
//         ],
//         children:  [
//           TileLayer(
//             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//             userAgentPackageName: 'com.example.app',
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 point: point,
//                 width: 80,
//                 height: 80,
//                 builder: (context) => const Icon(
//                   Icons.location_on,
//                   color: Colors.red,
//                   size: 50,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),