import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class GetAllProductData {
  Crud crud;
  GetAllProductData(this.crud);
  getAllProductData(token) async {
    var response = await crud.getData(AppLink.getAllProduct, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
