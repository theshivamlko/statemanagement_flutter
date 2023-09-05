import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/ParentState.dart';
import 'package:statemanagement/inheritedwidget/MyPage2.dart';
import 'package:statemanagement/inheritedwidget/MyPage3.dart';
import 'package:statemanagement/inheritedwidget/AppStateInherited.dart';
import 'package:statemanagement/inheritedwidget/ParentStateInherited.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateInherited(
      state: AppState(),
      child: MaterialApp(
        title: 'InheritedWidgetApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyPage1(title: 'InheritedWidgetApp'),
      ),
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
  @override
  Widget build(BuildContext context) {
    var parentState = AppStateInherited.of(context);
    print("MyPage1 build ${parentState?.counter} ${parentState.hashCode}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'App State ${parentState?.counter}',
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                ),
                onPressed: () {
                  parentState?.counter = parentState.counter + 1;
                  print(
                      "MyPage1 Counter $parentState ${parentState?.counter} ${AppStateInherited.of(context)?.counter} ${AppStateInherited.of(context).hashCode} ");
                  setState(() {});
                },
                child: Text("Counter")),
            ElevatedButton(
                onPressed: () async {
                  ParentState appState = ParentState();
                  //   print("MyPage1 Btn ${appState.hashCode} ");
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>   MyPage2() ));

                  setState(() {});
                },
                child: Text("MyPage2")),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {

                },
                child: Text("MyPage3"))
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant MyPage1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
}
