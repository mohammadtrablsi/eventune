
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';



class AllMyVenuesData {
  Crud crud;
  AllMyVenuesData(this.crud);
  var query;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.getAllForOwner}?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
