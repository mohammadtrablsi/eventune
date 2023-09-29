import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddTimeSchedule {
  Crud crud;
  AddTimeSchedule(this.crud);
  addTimeSchedule(token, startTime, endTime, id, isVenue) async {
    print(startTime);
    print(endTime);
    Map data = {};
    for (int i = 0; i < startTime.length; i++) {
      for (int j = 0; j < startTime[i].length; j++) {
        if (startTime[i].isNotEmpty) {
          data.addAll({'start_time[$i][$j]': startTime[i][j]});
          data.addAll({'end_time[$i][$j]': endTime[i][j]});
        }
      }
    }
    print('======');
    print(id.toString());
    print('======');

    var response = await crud.postData(
      isVenue
          ? AppLink.addTimeScheduleVenue + id.toString()
          : AppLink.addTimeScheduleStore + id.toString(),
      data,
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
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