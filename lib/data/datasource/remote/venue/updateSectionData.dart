import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class UpdateSectionData {
  Crud crud;
  UpdateSectionData(this.crud);
  updateSectionData(token, description, price, capacity, List deleteCat,
      levelPrices, List initialSelectCateigory, id) async {
    Map data = {};
    data['price'] = price;
    data['capacity'] = capacity;
    data['description'] = description;

    initialSelectCateigory.forEach((element) {
      for (int i = 0; i < 3; i++) {
        data['new_levels_prices[${element['id']}][$i]'] = '10';
        data['new_levels_names[${element['id']}][$i]'] =
            'L${i + 1}'.toString();
      }
    });
    for (int i = 1; i < deleteCat.length; i++) {
      data['delete_categories[${i + 1}]'] = deleteCat[i].toString();
    }

    print(data);

    var response = await crud.postData(
      AppLink.updateSection + id.toString(),
      data,
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
