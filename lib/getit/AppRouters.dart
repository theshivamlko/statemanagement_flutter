import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'GetItPage1.dart';


class AppRouters {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) =>GetItPage1());

      case "/bloc2":
        return MaterialPageRoute(
            builder: (_) =>GetItPage1());
      default:
        return null;
    }
  }
  void dispose(){

  }
}
