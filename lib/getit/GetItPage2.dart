import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:statemanagement/getit/ClassA.dart';
import 'package:statemanagement/getit/ClassB.dart';
import 'package:statemanagement/getit/ClassC.dart';
import 'package:statemanagement/getit/ClassD.dart';
import 'package:statemanagement/getit/ClassE.dart';

import '../AppState.dart';
import 'AbstractClassC.dart';
import 'ClassF.dart';
import 'ClassG.dart';


final getIt = GetIt.instance;


class GetItPage2 extends StatefulWidget {
  @override
  State<GetItPage2> createState() => _GetItPage2State();
}

class _GetItPage2State extends State<GetItPage2> {
  ClassA? classA;

  ClassB? classB;

  AbstractClassC? classC;

  ClassD? classD;

  ClassE? classE;
  ClassF? classF;
  ClassG? classG;
  AppState? appState;
  AppState? appState2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("getIt2 ${getIt.hashCode}");
    classA = getIt.get<ClassA>();
    classB = getIt.get<ClassB>();
    classC = getIt.get<AbstractClassC>();
    classD = getIt.get<ClassD>();
    classE = getIt.get<ClassE>();
    classF = getIt.get<ClassF>();
    classG = getIt.get<ClassG>();
    appState2 = getIt.get<AppState>(instanceName: 'AppState',param1: 100);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      appState = await getIt.getAsync<AppState>();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("GetItPage2 build ");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Get It Page 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("Class A ${classA.hashCode}${classA?.classACounter++}");
              setState(() {});
            },
            child: Text(
              'Class A ${classA?.classACounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Class B ${classB.hashCode} ${classB?.classBCounter++}");
              setState(() {});
            },
            child: Text(
              'Class B Singleton ${classB?.classBCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          /* GestureDetector(
            onTap: () {
              print("Class C ${classC.hashCode} ${classC?.classCCounter++}");
              setState(() {});
            },
            child: Text(
              'Class C ${classC?.classCCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),*/
          GestureDetector(
            onTap: () {
              print("Class D ${classD.hashCode} ${classD?.classDCounter++}");
              setState(() {});
            },
            child: Text(
              'Class D ${classD?.classDCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Class E ${classE.hashCode} ${classE?.classECounter++}");
              setState(() {});
            },
            child: Text(
              'Class E ${classE?.classECounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Class F ${classF.hashCode} ${classF?.classFCounter++}");
              setState(() {});
            },
            child: Text(
              'Class F ${classF?.classFCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Class G ${classG.hashCode} ${classG?.classGCounter++}");
              setState(() {});
            },
            child: Text(
              'Class G ${classG?.classGCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("appState Name ${appState2.hashCode} ${appState2?.counter++}");
              setState(() {});
            },
            child: Text(
              'appState ${appState2?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("appState Singleton ${appState?.counter++}");
              setState(() {});
            },
            child: Text(
              'appState Singleton ${appState?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/bloc2");
              },
              child: Text("GetItPage2")),
        ],
      ),
    );
  }
}
