import '../../../../core/class/crud.dart';
class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  subcatData(token) async {
    var response =
     await crud.getData('applink', {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
