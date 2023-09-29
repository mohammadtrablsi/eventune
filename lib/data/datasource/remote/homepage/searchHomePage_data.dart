import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class SearchHomePageData {
  Crud crud;
  SearchHomePageData(this.crud);
  var query;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response =
        await crud.getdata("${AppLink.searchHomePage}?attribute=$query", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
