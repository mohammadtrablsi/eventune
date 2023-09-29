
import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class MyOrderData {
  Crud crud;
  MyOrderData(this.crud);
  var pagenumber;
  var per_page = 3;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata(
        "${AppLink.userOrders}?page=$pagenumber&per_page=$per_page", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
