import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class SearchAllVenueOfCategoriesData {
  Crud crud;
  SearchAllVenueOfCategoriesData(this.crud);
  var query;
  var pagenumber;
  var catiid;
  var capicty;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata(
        "${AppLink.searchAllVenueOfCategories}/$catiid/$capicty/$query?page=$pagenumber",
        {},
        {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    return response.fold((l) => l, (r) => r);
  }
}
