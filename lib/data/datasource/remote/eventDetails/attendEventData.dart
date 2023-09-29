import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AttendEventData {
  Crud crud;
  AttendEventData(this.crud);
  attendEventData(token, eventId,password) async {
    var response = await crud.postData(
      '${AppLink.attendEvent}/${eventId.toString()}',{
        'password':password,
      },
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
