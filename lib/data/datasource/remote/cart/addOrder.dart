
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddOrderData {
  Crud crud;
  AddOrderData(this.crud);
  addOrderData(token, password, idStore, ids, quantity, date, time, delivery,
      longitude, latitude, idVenue) async {
    Map data = {};
    if (delivery == 1) {
      if (longitude == -1 || latitude == -1) {
        data = {
          'date': date,
          'time': time,
          'delivery': delivery.toString(),
          'venue_id': idVenue.toString()
        };
      } else {
        data = {
          'date': date,
          'time': time,
          'delivery': delivery.toString(),
          'latitude': latitude.toString(),
          'longitude': longitude.toString()
        };
      }
    } else {
      data = {
        'date': date,
        'time': time,
      };
    }
    for (int i = 0; i < ids.length; i++) {
      data['ids[$i]'] = ids[i].toString();
      data['quantity[$i]'] = quantity[i].toString();
    }
    data['password'] = password.toString();
    var response = await crud.postData(
      AppLink.addOrder + idStore.toString(),
      data,
      {
        //  'Content-Type': 'multipart/form-data',
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
