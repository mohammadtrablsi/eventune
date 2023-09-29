import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SectionsData {
  Crud crud;
  SectionsData(this.crud);
  var id;
  var pagenumber;
  getsubcatigoriesdata(token) async {
    var response =
        await crud.getdata("${AppLink.allSection}/$id?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
