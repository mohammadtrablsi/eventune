import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class StorePendingData {
  Crud crud;
  StorePendingData(this.crud);
  var storeid;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response = await crud
        .getdata("${AppLink.pendingInStore}/$storeid?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
