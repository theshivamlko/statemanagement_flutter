import 'package:flutter/material.dart';
    import 'package:statemanagement/riverpod/MyRiverpodPage1.dart';

class RiverpodWidgetApp extends StatelessWidget {
  const RiverpodWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProviderWidgetApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyRiverpodPage1(),
    );
  }
}
