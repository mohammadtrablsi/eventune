import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class UpdateTimeData {
  Crud crud;
  UpdateTimeData(this.crud);
  updateTimeData(token, startTime, endTime, id, isVenue, day) async {
    print(startTime);
    
    var response = await crud.postData(
      isVenue == true
          ? '${AppLink.updateTimeVenue + id.toString()}/${day.toString()}'
          : '${AppLink.updateTimeStore + id.toString()}/${day.toString()}',
      {'start_time': startTime, 'end_time': endTime},
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
