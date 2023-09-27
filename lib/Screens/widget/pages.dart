import 'package:flutter/material.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static List<PageEntity> Routes() {
    return [];
  }

  static List<dynamic> Blocer(BuildContext context) {
    List<dynamic> blocerList = <dynamic>[];
    for (var blocer in Routes()) {
      blocerList.add(blocer.bloc);
    }
    return blocerList;
  }

  // static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
  //   if (settings.name != null) {
  //     var result = Routes().where((element) => element.page == settings.name);
  //     if (result.isNotEmpty) {
  //       bool deviceFirstOpen = Global.storageServices.getDeviceFirstOpen();
  //       if (result.first.path == AppRoutes.INITIAL && deviceFirstOpen) {
  //         bool isLogin = Global.storageService.getIsLogin();
  //         if (isLogin) {
  //           return MaterialPageRoute<void>(
  //               builder: (_) => Application(), settings: settings);
  //         }
  //       }
  //     }
  //   }
  // }
}

class PageEntity<T> {
  Widget page;
  dynamic bloc;

  PageEntity({required this.page, required this.bloc});
}
