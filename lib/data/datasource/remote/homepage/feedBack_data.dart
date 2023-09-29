


import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class FeedBackData {
  Crud crud;
  FeedBackData(this.crud);
  var content;
  send(token) async {
    var response = await crud.postData(AppLink.feedBack, {
      'content':'$content',
    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }

}


