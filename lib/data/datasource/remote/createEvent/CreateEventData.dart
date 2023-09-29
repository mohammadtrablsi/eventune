import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CreateEventData {
  Crud crud;
  CreateEventData(this.crud);
  createEventData(
      token,
      passowrd,
      name,
      description,
      capacity,
      date,
      startTime,
      period,
      cost,
      isFree,
      privacy,
      levelId,
      sectionId,
      equpment,
      images) async {
    Map data = {};
    if (equpment == 1) {
      data = {
        'name': name,
        'description': description,
        'capacity': capacity.toString(),
        'date': date,
        'start_time': startTime,
        'period': period.toString(),
        'privacy': privacy,
        'level_id': levelId.toString(),
      };
    } else {
      data = {
        'name': name,
        'description': description,
        'capacity': capacity.toString(),
        'date': date,
        'start_time': startTime,
        'period': period.toString(),
        'privacy': privacy,
        // 'level_id': levelId,
      };
    }
    if (isFree == false) {
      data['cost'] = cost.toString();
    }
    data['password'] = passowrd.toString();

    print('============================== $data');
    var response = await crud.postMutipleImagesAndData(
        '${AppLink.createEvent}/${sectionId.toString()}',
        data,
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
        images,
        1);
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
