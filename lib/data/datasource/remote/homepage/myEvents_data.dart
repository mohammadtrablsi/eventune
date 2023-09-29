import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class MyEventsData {
  Crud crud;
  MyEventsData(this.crud);
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response =
        await crud.getdata("${AppLink.myEvents}?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
