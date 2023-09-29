import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);
  var emailController;
  accept(token) async {
    var response = await crud.postData(AppLink.forgetPassword, {
      'email': emailController,
    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
