import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
    import 'package:statemanagement/riverpod/MyRiverpodPage1.dart';

import 'BlocPage1.dart';
import 'CounterCubit.dart';

class BlocWidgetApp extends StatelessWidget {
  const BlocWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProviderWidgetApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  BlocProvider<CounterCubit>(
          create:(context)=> CounterCubit(),
          child: BlocPage1()),
    );
  }
}
