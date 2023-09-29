import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class GetAllCateigoryData {
  Crud crud;
  GetAllCateigoryData(this.crud);
  getAllCateigoryData(token) async {
    var response = await crud.getData(AppLink.getAllCategory, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
