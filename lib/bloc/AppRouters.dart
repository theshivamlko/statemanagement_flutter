import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BlocPage1.dart';
import 'BlocPage2.dart';
import 'CounterCubit.dart';
import 'CounterCubit2.dart';

class AppRouters {
  CounterCubit counterCubit = CounterCubit();
  CounterCubit2 counterCubit2 = CounterCubit2();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: counterCubit, child: BlocPage1()));

      case "/bloc2":
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: counterCubit),
                    BlocProvider.value(value: CounterCubit2()),
                  ],
                  child: BlocPage2(),
                ));
      default:
        return null;
    }
  }
  void dispose(){
    counterCubit.close();
    counterCubit2.close();
  }
}
