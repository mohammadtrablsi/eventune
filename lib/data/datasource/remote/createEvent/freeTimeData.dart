import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class FreeTimeEventData {
  Crud crud;
  FreeTimeEventData(this.crud);
  freeTimeEventData(token, date, id) async {
    Map data = {};
    data = {
      'date': date,
    };
    var response = await crud.postData(
      AppLink.freeTimeForEvent + id.toString(),
      data,
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
