import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/providers/MyBlocNotifier.dart';
import 'package:statemanagement/providers/MyBlocNotifier2.dart';
import 'package:statemanagement/providers/MyBlocNotifierWithParam.dart';

class MyProviderPage4 extends StatefulWidget {
  const MyProviderPage4({super.key});

  @override
  State<MyProviderPage4> createState() => _MyProviderPage4State();
}

class _MyProviderPage4State extends State<MyProviderPage4> {
  // late MyBlocNotifierWithParam myBlocNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<MyBlocNotifier2> getData() async {
    await Future.delayed(Duration(seconds: 5));
    var bloc = context.read<MyBlocNotifier>();
    var bloc2 = context.read<MyBlocNotifier2>();
    bloc2.appState.counter = bloc.appState.counter;
    print("FutureProvider2");
    return bloc2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyProviderPage4"),
      ),
      body: FutureProvider<MyBlocNotifier2>(
        create: (ctx) => getData(),
        initialData: MyBlocNotifier2(),
        catchError: (ctx, e) {
          print("FutureProvider catchError $e");
          return MyBlocNotifier2();
        },
        builder: (context, child) {
          print("FutureProvider");

        //  var bloc = context.read<MyBlocNotifier2>();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<MyBlocNotifier2>(builder: (context, bloc, child) {
                  print("FutureProvider Consumer");

                  return GestureDetector(
                      onTap: () {
                        bloc.appState.counter++;
                      },
                      child: Text(
                        //    'Proxy ${myBlocNotifier.appState?.counter} \n '
                        'Bloc1 ${bloc.appState.counter} \n ',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  }
                ),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(onTap: () {}, child: ChildWidget())
              ],
            ),
          );
        },
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Text(
              'BLOC1 State  ${context.read<MyBlocNotifier2>().appState.counter}',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
