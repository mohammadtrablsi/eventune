import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class UpdateVenueData {
  Crud crud;
  UpdateVenueData(this.crud);
  updateVenueData(
      token, name, description, longitude, latitude, phoneNumber, id) async {
    Map data = {};
    bool ok = false;
    if (name != null) {
      data['name'] = name;
      ok = true;
      print('1====');
    }
    if (description != null) {
      data['description'] = description;
      ok = true;
      print('2====');
    }
    if (longitude != null && latitude != null) {
      data['longitude'] = longitude.toString();
      data['latitude'] = latitude.toString();
      ok = true;
      print('3====');
    }

    var response1, response2;
    if (ok) {
      response1 = await crud.postData(
        AppLink.updataVenue + id.toString(),
        data,
        {'Authorization': 'Bearer $token'},
      );
    }
    if (phoneNumber != null) {
      response2 = await crud.postData(
        AppLink.updataPhoneVenue + id.toString(),
        {'phone_number': phoneNumber.toString()},
        {
          //  'Content-Type': 'multipart/form-data',
          //"Accept": "application/json",
          'Authorization': 'Bearer $token'
        },
      );
    }

    print('============== $response1 ==============$response2 ==============');
    return response1.fold((l) => l, (r) => r);
  }
  
}
