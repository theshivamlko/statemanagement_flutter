import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/providers/MyBlocNotifier.dart';
import 'package:statemanagement/providers/MyBlocNotifier2.dart';
import 'package:statemanagement/providers/MyBlocNotifierWithParam.dart';
import 'package:statemanagement/providers/MyProviderPage2.dart';
import 'package:statemanagement/providers/MyProviderPage3.dart';
import 'package:statemanagement/providers/MyProviderPage4.dart';

class MyProviderPage1 extends StatefulWidget {
  MyProviderPage1({super.key});

  @override
  State<MyProviderPage1> createState() => _MyProviderPage1State();
}

class _MyProviderPage1State extends State<MyProviderPage1> {
  //MyBlocNotifier myBlocNotifier = MyBlocNotifier();
  late MyBlocNotifier2 myBlocNotifier2;
  late MyBlocNotifier myBlocNotifier;

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
  Widget build(BuildContext context2) {
    myBlocNotifier2 = Provider.of<MyBlocNotifier2>(context2);
    myBlocNotifier = Provider.of<MyBlocNotifier>(context2  );
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
              //  myBlocNotifier.increment();
               myBlocNotifier2.increment();
                },
                child: Text("Counter")),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer<MyBlocNotifier>(builder: (context, bloc, child) {
              return GestureDetector(
                onTap: () {
                  bloc.increment();
                  //   myBlocNotifier2.increment();
                },
                child: Text(
                  'BLOC1 ${myBlocNotifier.appState?.counter}\n'
                  'BLOC2 ${myBlocNotifier2.appState?.counter} \n'
                  'Consumer BLOC1 ${bloc.appState?.counter} \n',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer<MyBlocNotifier2>(builder: (context, bloc, child) {
              // listen not works here
              var bloc2 = Provider.of<MyBlocNotifier2>(context2, listen: false);
              return GestureDetector(
                onTap: () {
                  bloc.increment();
                  //   myBlocNotifier2.increment();
                },
                child: Text(
                  'BLOC2 ${myBlocNotifier2.appState?.counter} \n'
                  'Consumer BLOC2 ${bloc.appState?.counter} \n',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  //   print("MyPage1 Btn ${appState.hashCode} ");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              ChangeNotifierProvider<MyBlocNotifier2>(
                                create: (ctx) => MyBlocNotifier2(),
                                builder: (context, child) {
                                  print("ChangeNotifierProxyProvider3 build");
                                  return MyProviderPage2();
                                },
                              )));
                },
                child: Text("MyProviderPage2")),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider<MyBlocNotifier2>(
                                    create: (ctx) => MyBlocNotifier2(),
                                  ),
                                  ChangeNotifierProxyProvider<MyBlocNotifier2,
                                          MyBlocNotifierWithParam>(
                                      create: (ctx) =>
                                          MyBlocNotifierWithParam(),
                                      update: (context, value, previous) {
                                        return MyBlocNotifierWithParam.count(
                                            value?.appState.counter ?? 0);
                                      },
                                      builder: (context, child) {
                                        return MyProviderPage3();
                                      }),
                                ],
                              )));
                },
                child: Text("MyProviderPage3")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ChangeNotifierProvider<MyBlocNotifier2>(
                          create: (ctx) => MyBlocNotifier2(),
                          builder: (context, child) {
                          return MyProviderPage4();
                        }
                      )));
                },
                child: Text("MyProviderPage4"))
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
  void didUpdateWidget(covariant MyProviderPage1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void dispose() {
    myBlocNotifier?.dispose();
    myBlocNotifier2?.dispose();
    super.dispose();
  }
}
