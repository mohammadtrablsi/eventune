

import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  var emailController;
  var password;
  var password2;
  accept() async {
    var response = await crud.postData(AppLink.resetPassword, {
      'email':emailController,
      'password':password,
      'password_confirmation':password2,
    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
