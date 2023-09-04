import 'package:flutter/material.dart';
import 'package:statemanagement/inheritedwidget/StateInheritedState.dart';

class MyPage3 extends StatefulWidget {
  const MyPage3({super.key});

  @override
  State<MyPage3> createState() => _MyPage3State();
}

class _MyPage3State extends State<MyPage3> {
  @override
  Widget build(BuildContext context) {
    var appState = StateInheritedState.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('MyPage3'),
        ),
        body: Text('${appState?.counter}', style: TextStyle(fontSize: 20)));
  }
}
