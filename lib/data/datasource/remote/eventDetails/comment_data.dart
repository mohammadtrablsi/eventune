import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';


class CommentData {
  Crud crud;
  CommentData(this.crud);
  var query;
  var pagenumber;
  var type;
  var evid;
  getsubcatigoriesdata(token) async {
    var response = await crud.getdata("${AppLink.allComments}/$type/$evid?page=$pagenumber", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
