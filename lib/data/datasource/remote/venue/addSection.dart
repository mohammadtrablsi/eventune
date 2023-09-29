import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddSection {
  Crud crud;
  AddSection(this.crud);
  addSection(token, descriptions, prices, capacities, images, levelPrices,
      levels, initialSelectCateigory,id) async {
    Map data = {};
    for (int i = 0; i < prices.length; i++) {
      data['prices[$i]'] = prices[i];
      data['capacities[$i]'] = capacities[i];
      data['descriptions[$i]'] = descriptions[i];
    }

    for (int i = 0; i < prices.length; i++) {
      for (int j = 0; j < initialSelectCateigory[i].length; j++) {
        for (int k = 0; k < 3; k++) {
          data['level_prices[$i][${initialSelectCateigory[i][j]['id']}][$k]'] =
              levelPrices[i][initialSelectCateigory[i][j]['id']][k];
          data['levels[$i][${initialSelectCateigory[i][j]['id']}][$k]'] =
              levels[i][initialSelectCateigory[i][j]['id']][k];
        }
      }
    }
    // for (int i = 0; i < startTime.length; i++) {
    //   for (int j = 0; j < startTime[i].length; j++) {
    //     if (startTime[i].isNotEmpty) {
    //       data.addAll({'start_time[$i][$j]': startTime[i][j]});
    //       data.addAll({'end_time[$i][$j]': endTime[i][j]});
    //     }
    //   }
    // }
    var response = await crud.postMutipleImagesAndData(
        AppLink.addSection+id.toString(),
        data,
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
        images,
        2);
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
