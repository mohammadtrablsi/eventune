import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddImageStoreOrEventData {
  Crud crud;
  AddImageStoreOrEventData(this.crud);
  addImageStoreOrEventData(token, images, id, isVenue) async {
    var response = await crud.postMutipleImagesAndData(
        isVenue == true
            ? AppLink.addImagesVenue
            : AppLink.addImagesStore + id.toString(),
        {},
        {'Authorization': 'Bearer $token'},
        images,
        1);
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }

  updateImageStoreOrEventData(token, images, id, isVenue) async {
    var response = await crud.postMutipleImagesAndData(
        isVenue == true
            ? AppLink.updateImagesVenue
            : AppLink.updateImagesStore + id.toString(),
        {},
        {'Authorization': 'Bearer $token'},
        images,
        1);
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
