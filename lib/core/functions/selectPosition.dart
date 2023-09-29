import 'package:geocoding/geocoding.dart';

Future<String> getAddress(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    String address =
        '${place.street} , ${place.locality}, ${place.postalCode}, ${place.country}';
    // , ${place.locality}, ${place.postalCode}, ${place.country}
    print('[adreess]===== $address');
    return address;
  } catch (e) {
    return 'Error: $e';
  }
}
