import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  loginData(email, password) async {
    var response = await crud.postData(AppLink.login, {
      'email': email,
      'password': password,
    }, {
      'Accept': 'application/json',
    });
    return response.fold((l) => l, (r) => r);
  }

  logoutData() async {
    var response = await crud.postData(AppLink.logout, {}, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppLink.token.toString()}'
    });
    return response.fold((l) => l, (r) => r);
  }

  roleOwnerData(password) async {
    var response = await crud.postData(AppLink.roleOwner, {
      'password': password.toString()
    }, {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppLink.token.toString()}'
    });
    return response.fold((l) => l, (r) => r);
  }

  myWalletData() async {
    var response = await crud.getData(AppLink.myWallet, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppLink.token.toString()}'
    });
    return response.fold((l) => l, (r) => r);
  }
}
