import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:statemanagement/getit/ClassA.dart';
import 'package:statemanagement/getit/ClassB.dart';
import 'package:statemanagement/getit/ClassC.dart';
import 'package:statemanagement/getit/ClassD.dart';
import 'package:statemanagement/getit/ClassE.dart';

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

  ClassC? classC;

  ClassD? classD;

  ClassE? classE;
  ClassF? classF;
  ClassG? classG;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    classA = getIt.get<ClassA>();
    classB = getIt.get<ClassB>();
    // classC = getIt.get<ClassC>();
    classD = getIt.get<ClassD>();
    classE = getIt.get<ClassE>();
    classF = getIt.get<ClassF>();
    classG = getIt.get<ClassG>();
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
              'Class B ${classB?.classBCounter}',
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
