import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CustomCreateEventData {
  Crud crud;
  CustomCreateEventData(this.crud);
  customCreateEventData(
      token,
      password,
      name,
      description,
      capacity,
      date,
      startTime,
      endTime,
      cost,
      longitude,
      latitude,
      privacy,
      free,
      images) async {
    Map data = {};
    data = privacy == 'private' || cost == 0 || cost == null || free
        ? {
            'name': name,
            'description': description,
            'capacity': capacity,
            'date': date,
            'start_time': startTime,
            'end_time': endTime,
            'privacy': privacy,
            'latitude': latitude.toString(),
            'longitude': longitude.toString(),
          }
        : {
            'name': name,
            'description': description,
            'capacity': capacity,
            'date': date,
            'start_time': startTime,
            'end_time': endTime,
            'privacy': privacy,
            'cost': cost,
            'latitude': latitude.toString(),
            'longitude': longitude.toString(),
          };
    data['password'] = password.toString();
    var response = await crud.postMutipleImagesAndData(
        AppLink.customCreateEvent,
        data,
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
        images,
        1);
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
//  Map data = {};
//     for (int i = 0; i < startTime.length; i++) {
//       for (int j = 0; j < startTime[i].length; j++) {
//         if (startTime[i].isNotEmpty) {
//           data.addAll({'start_time[$i][$j]': startTime[i][j]});
//           data.addAll({'end_time[$i][$j]': endTime[i][j]});
//         }
//       }
//     }