import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/riverpod/MyRiverpodPage1.dart';

import 'BlocPage1.dart';
import 'BlocPage2.dart';
import 'CounterCubit.dart';
import 'CounterCubit2.dart';

class BlocWidgetApp extends StatelessWidget {
    BlocWidgetApp({super.key});

  CounterCubit counterCubit = CounterCubit();
  CounterCubit2 counterCubit2 = CounterCubit2();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProviderWidgetApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) =>
            BlocProvider.value(value: counterCubit, child: BlocPage1()),
        "/bloc2": (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: counterCubit),
                BlocProvider.value(value: counterCubit2),
              ],
              child: BlocPage2(),
            ),
      },
      onGenerateRoute: (settings) {},
      /*home: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(), child: BlocPage1()),*/
    );
  }
}
