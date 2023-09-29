import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  signupData(String name, String email, password) async {
    var response = await crud.postData(AppLink.register, {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
    }, {
      'Accept': 'application/json',
      // 'Content-Type': 'application/json',
    });
    return response.fold((l) => l, (r) => r);
  }
}
