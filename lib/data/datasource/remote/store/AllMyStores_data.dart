import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AllMyStoresData {
  Crud crud;
  AllMyStoresData(this.crud);
  var query;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response =
        await crud.getdata("${AppLink.allMyStores}?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
