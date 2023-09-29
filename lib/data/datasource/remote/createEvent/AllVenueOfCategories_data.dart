
import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';


class AllVenueOfCategoriesData {
  Crud crud;
  AllVenueOfCategoriesData(this.crud);
  var catiid;
  var pagenumber;
  var capicty;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.allVenueOfCategories}/$catiid/$capicty/?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
