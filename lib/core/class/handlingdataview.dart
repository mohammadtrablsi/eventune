import 'package:flutter/material.dart';
import 'package:Eventune/core/class/statusrequest.dart';

import '../constant/color.dart';
import '../constant/imgaeasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?  Center(
            child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Image.asset(AppImageAsset.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Image.asset(AppImageAsset.server,
                        width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Image.asset(
                        AppImageAsset.nodata,
                        width: 250,
                        height: 250,
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?  Center(
            child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ))
        : widget;
  }
}
