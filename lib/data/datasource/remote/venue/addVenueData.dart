import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddVenueData {
  Crud crud;
  AddVenueData(this.crud);
  addVenueData(token, name, description, longitude, latitude, phoneNumber,
      images) async {
    var response = await crud.postMutipleImagesAndData(
        AppLink.addVenue,
        {
          'name': name,
          'description': description,
          'longitude': '500',
          'latitude': '200',
          'phone_number': phoneNumber,
        },
        {
          //  'Content-Type': 'multipart/form-data',
          //"Accept": "application/json",
          'Authorization': 'Bearer $token'
        },
        images,
        1);

    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
