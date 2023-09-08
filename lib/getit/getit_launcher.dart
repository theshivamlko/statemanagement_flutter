import 'package:flutter/material.dart';
import 'AppRouters.dart';
import 'injection_container.dart';

class GetItWidgetApp extends StatelessWidget {
  const GetItWidgetApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("GetItWidgetApp build ");



    return MaterialApp(
      title: 'GetIt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (routeSettings) =>
          AppRouters().onGenerateRoute(routeSettings),
    );
  }
}
