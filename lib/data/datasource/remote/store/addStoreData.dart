import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddStoreData {
  Crud crud;
  AddStoreData(this.crud);
  addStoreData(token, name, description, longitude, latitude, phoneNumber,
      images, hasDelivery, deliveryCost) async {
    var response = await crud.postMutipleImagesAndData(
        AppLink.addStore,
        hasDelivery == 1
            ? {
                'name': name,
                'description': description,
                'longitude': '500',
                'latitude': '200',
                'phone_number': phoneNumber,
                'hasDelivery': hasDelivery,
                'deliveryCost': deliveryCost
              }
            : {
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
