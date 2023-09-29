import '../../../../core/class/crud.dart';
class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
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
