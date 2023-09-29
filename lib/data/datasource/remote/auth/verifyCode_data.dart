

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  var emailController;
  var code;
  accept() async {
    var response = await crud.postData("${AppLink.verifyCode}/$code", {
      'email':emailController,
    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
