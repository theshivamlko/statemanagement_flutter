import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/providers/MyBlocNotifier.dart';
import 'package:statemanagement/providers/MyBlocNotifier2.dart';
import 'package:statemanagement/providers/MyProviderPage2.dart';

class MyProviderPage1 extends StatefulWidget {
  MyProviderPage1({
    super.key,
  });

  @override
  State<MyProviderPage1> createState() => _MyProviderPage1State();
}

class _MyProviderPage1State extends State<MyProviderPage1> {
  //MyBlocNotifier myBlocNotifier = MyBlocNotifier();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*  myBlocNotifier.addListener(() {
      print(
          "addListener  ${myBlocNotifier.appState.counter} ${myBlocNotifier.appState.hashCode}");
      //  setState(() {});
    });*/
  }

  @override
  Widget build(BuildContext context) {
    MyBlocNotifier2 myBlocNotifier2 = Provider.of<MyBlocNotifier2>(context);
    MyBlocNotifier myBlocNotifier = Provider.of<MyBlocNotifier>(context);
    print("MyProviderPage1 build  ${myBlocNotifier2.appState.counter}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ProviderWidgetApp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Provider',
            ),
            Text(
              'BLOC1 ${myBlocNotifier.appState?.counter}\n'
              'BLOC2 ${myBlocNotifier2.appState?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  myBlocNotifier.increment();
                  myBlocNotifier2.increment();
                },
                child: Text("Counter")),
            ElevatedButton(
                onPressed: () {
                  //   print("MyPage1 Btn ${appState.hashCode} ");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => MyProviderPage2()));
                },
                child: Text("MyProviderPage2")),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (ctx) => MyPage3()));
                },
                child: Text("MyProviderPage3"))
          ],
        ),
      ),
    );
  }
}
