import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class AllStoresData {
  Crud crud;
  AllStoresData(this.crud);
  var query;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.allStores}?per_page=20", {}, {
      'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
