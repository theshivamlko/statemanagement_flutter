import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/MyBlocNotifier.dart';
import 'package:statemanagement/providers/MyBlocNotifier2.dart';
import 'package:statemanagement/providers/MyProviderPage1.dart';

class ProviderWidgetApp extends StatelessWidget {
  const ProviderWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyBlocNotifier>(
        create: (ctx) => MyBlocNotifier(),
        builder: (context, child) {
          return MaterialApp(
            title: 'ProviderWidgetApp',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Provider<MyBlocNotifier2>(
                create: (ctx) => MyBlocNotifier2(),
                builder: (context, child) {
                  return MyProviderPage1();
                }),
          );
        });
  }
}
