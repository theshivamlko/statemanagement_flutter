import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/inheritedwidget/MyPage2.dart';
import 'package:statemanagement/inheritedwidget/MyPage3.dart';
import 'package:statemanagement/inheritedwidget/StateInheritedState.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidgetApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPage1(title: 'InheritedWidgetApp'),
    );
  }
}

class MyPage1 extends StatefulWidget {
  const MyPage1({super.key, required this.title});

  final String title;

  @override
  State<MyPage1> createState() => _MyPage1State();
}

class _MyPage1State extends State<MyPage1> {
  AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    // var appState=StateInheritedState.of(context);
    print("MyPage1 build ${appState?.counter} ${appState.hashCode}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Launcher Page Inherited',
            ),
            Text(
              '${appState?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  StateInheritedState.of(context)?.counter =
                      (StateInheritedState.of(context)?.counter ?? 1) + 1;
                  appState?.counter = appState.counter + 1;
                  print(
                      "MyPage1 Counter ${appState} ${appState?.counter} ${StateInheritedState.of(context)?.counter} ${StateInheritedState.of(context).hashCode} ");
                },
                child: Text("Counter")),
            ElevatedButton(
                onPressed: () {
                  AppState appState = AppState();
                  print("MyPage1 Btn ${appState.hashCode} ");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => StateInheritedState(
                              appState: appState, child: MyPage2())));
                },
                child: Text("MyPage2")),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => MyPage3()));
                },
                child: Text("MyPage3"))
          ],
        ),
      ),
    );
  }
}
