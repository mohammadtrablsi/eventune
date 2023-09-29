


import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class MakeCommentData {
  Crud crud;
  MakeCommentData(this.crud);
  var type;
  var evid;
  var comment;
  send(token) async {
    var response = await crud.postData("${AppLink.makeComment}/$type/$evid", {
      'comment':'$comment',
    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }

}

