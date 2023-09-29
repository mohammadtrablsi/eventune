import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class EventDetailsWithoutAuthrizeData {
  Crud crud;
  EventDetailsWithoutAuthrizeData(this.crud);
  eventDetailsWithoutAuthrizeData(typePlace, eventId) async {
    var response = await crud.getData(
      '${AppLink.getinfoEventWithoutAuthrize}$typePlace/${eventId.toString()}',
      {
        'Accept': 'application/json',
      },
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }

  acceptEventData(token, typePlace, eventId) async {
    var response = await crud.postData(
      '${AppLink.replyInviteEventByDeepLink}$typePlace/${eventId.toString()}/accept',
      {},
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print('============== $response ==============');
    return response.fold((l) => l, (r) => r);
  }
}
