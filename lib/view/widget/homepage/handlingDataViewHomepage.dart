import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/imgaeasset.dart';

class HandlingDataViewHomePage extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Widget loadingWidget;
  const HandlingDataViewHomePage(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      required this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? loadingWidget
        : statusRequest == StatusRequest.serverfailure
            ? Center(
                child: Image.asset(
                  AppImageAsset.nodata,
                  width: 60.w,
                  height: 60.h,
                ))
            : widget;
  }
}
