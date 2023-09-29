import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class HomePageItemsData {
  Crud crud;
  HomePageItemsData(this.crud);
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response =
        await crud.getdata("${AppLink.allEvents}?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
