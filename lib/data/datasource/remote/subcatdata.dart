import '../../../core/class/crud.dart';
class SubcatData {
  Crud crud;
  SubcatData(this.crud);
  subcatData(token) async {
    var response =
        await crud.getData('applink', {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjE2YzNhOGU4NWZmY2M1ZmI5Y2M4MzlhMmQ4OTUzYjhhZDMyY2Q5MjVmOGNiNTIzZDNmYzRmOGY0Nzk4M2I3MTZkMWI5MDFlOTExMTcyZmMiLCJpYXQiOjE2ODE0MTEzNDUuODEyNzY1LCJuYmYiOjE2ODE0MTEzNDUuODEyNzY5LCJleHAiOjE3MTMwMzM3NDUuODAyMzE2LCJzdWIiOiIxNSIsInNjb3BlcyI6W119.HT8bSnTtXCL4nUlpNb9lKOKgDD-ObNzvuo6Gz2fiyx1Y3q4mgyIMFLcaheq20cRnXPFDax7JtuUwxmM730LxKK2ws-qmsx4asPY_hFPAPS6Z_F-xu-u0Y3Fg8JmEgsRedeSXADwJ_ww5rF-dQ0mnDvTtFyjrkWyyNnbUTBRmmp0aGCLyOVU3qMtdkYwsrjl1NCEQnOfoeEtx_fjyKLuec8jO72RCYXW57wlVSgVzhRMwwzr_V0REYip5Cb1VEofPPIoLTcB442CHw3U1vejrIjyH3ielaQb9yow1OFlBohf27whwwldMr-SlOCcPgny4ObCYj6LCXdIriOMGlkKRtoW3A4BVzyZ_bZNv05670UlDehVCE1dpYyXkme_AoslP6wMIr7U8_M_AP5-PC3a4u0Tuj2GUUxdyd9Uegb4wgP2H49RNfJHdJRW2jIUexsKMGeJLhLnEu6-YljOA61TH8j76U8l8bQWVOeESUtzKlHXJ5ePXLoaNr49IdtTg0FkL_-d8yHLN-4cM2T3t-oPhr_NotEIRs4kk4Ac8yvalkQYWwLQjQyJrx6PvDVfKviFE3BkFS-Tzxlp_VLlfJHIqEveR2NY6Q2QXPxHbgksTOZKXdSjynTI0n8HO50JDIDSHggBkx5Q2tvYIpONxZWlqAQnfOcS5kWtPbae7if6cm0Q'
    });
    return response.fold((l) => l, (r) => r);
  }
}
