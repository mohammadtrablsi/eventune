// ignore_for_file: prefer_interpolation_to_compose_strings

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class PromoteData {
  Crud crud;
  PromoteData(this.crud);
  promoteData(token, password, eventId, typePlace, text, type) async {
    if (type == 1) {
      var response = await crud.postData(
          '${'${AppLink.promotSuggetion}${eventId.toString()}/' + typePlace}?hours=${text.toString()}',
          {
            'password': password
          },
          {
            // 'Accept': 'application/json',
            // 'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.postData(
          '${'${AppLink.promotNotification}${eventId.toString()}/' + typePlace}}',
          {
            'password': password
          },
          {
            // 'Accept': 'application/json',
            // 'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      return response.fold((l) => l, (r) => r);
    }
  }
}
