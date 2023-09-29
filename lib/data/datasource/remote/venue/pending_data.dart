

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class PendingData {
  Crud crud;
  PendingData(this.crud);
  var venid;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.pendingInVenue}/$venid?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
