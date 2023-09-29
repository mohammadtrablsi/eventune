import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddProductData {
  Crud crud;
  AddProductData(this.crud);
  addProduct(token, Map productsIds, Map prices, Map descriptions, Map names,
      Map<int, List<File?>> images, id) async {
    Map data = {};
    productsIds.forEach((key, value) {
      data['products_ids[$key]'] = value.toString();
    });
    prices.forEach((key, value) {
      data['prices[$key]'] = value;
    });
    descriptions.forEach((key, value) {
      data['descriptions[$key]'] = value;
    });
    names.forEach((key, value) {
      data['names[$key]'] = value;
    });

    var response = await crud.postMutipleImagesAsMapAndData(
        AppLink.addProduct+id.toString(),
        data,
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
        images,
        2);
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
