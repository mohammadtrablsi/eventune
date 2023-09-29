import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class RegisteredEventsData {
  Crud crud;
  RegisteredEventsData(this.crud);
  var pagenumber;
  var per_page = 20;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata(
        "${AppLink.registeredEvents}?per_page=$per_page&page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
