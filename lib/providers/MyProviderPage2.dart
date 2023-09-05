import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/providers/MyBlocNotifier.dart';
import 'package:statemanagement/providers/MyBlocNotifier2.dart';

class MyProviderPage2 extends StatefulWidget {
  const MyProviderPage2({super.key});

  @override
  State<MyProviderPage2> createState() => _MyProviderPage2State();
}

class _MyProviderPage2State extends State<MyProviderPage2> {
  late MyBlocNotifier myBlocNotifier;
  late MyBlocNotifier2 myBlocNotifier2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myBlocNotifier = Provider.of<MyBlocNotifier>(context);
    myBlocNotifier2 = Provider.of<MyBlocNotifier2>(context);

    print("MyProviderPage2 build  ${myBlocNotifier.appState.counter}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyProviderPage2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                myBlocNotifier.increment();
              },
              child: Text(
                '${myBlocNotifier.appState?.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                },
                child: Text("Counter")),
            Padding(padding: EdgeInsets.all(20)),
            GestureDetector(
              onTap: () {
                myBlocNotifier2.increment();

              },
              child: Text(
                '${myBlocNotifier2.appState?.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
