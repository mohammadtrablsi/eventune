

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';



class AcceptStoreData {
  Crud crud;
  AcceptStoreData(this.crud);
  var Storeid;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.acceptInStore}/$Storeid?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
