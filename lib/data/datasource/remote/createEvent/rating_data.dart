
import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';



class RatingData {
  Crud crud;
  RatingData(this.crud);
  var venOrStoId;
  var venueOrStore;
  var numberOfStars;
  getsubcatigoriesdata(token) async {
    var response = await crud.postData("${AppLink.rating}/$venueOrStore/$venOrStoId", {
    'stars': numberOfStars,

    }, {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response.fold((l) => l, (r) => r);
  }
}
