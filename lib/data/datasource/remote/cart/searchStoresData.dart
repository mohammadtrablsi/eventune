

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';


class SearchStoresData {
  Crud crud;
  SearchStoresData(this.crud);
  var query;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.searchStore}/$query?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
