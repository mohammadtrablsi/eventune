

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class ReplayPendingData {
  Crud crud;
  ReplayPendingData(this.crud);
  var reqid;
  var resultOfReplay;
  var reasone;
  accept(token) async {
    var response = await crud.postData("${AppLink.replaypendingInVenue}/$reqid/$resultOfReplay", {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
  reject(token) async {
    var response = await crud.postData("${AppLink.replaypendingInVenue}/$reqid/$resultOfReplay", {
      'reasone':'$reasone',
    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }

}
