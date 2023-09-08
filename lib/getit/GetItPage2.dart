import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:statemanagement/getit/ClassA.dart';
import 'package:statemanagement/getit/ClassB.dart';
import 'package:statemanagement/getit/ClassC.dart';
import 'package:statemanagement/getit/ClassD.dart';
import 'package:statemanagement/getit/ClassE.dart';


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classA = GetIt.instance();
    classB = GetIt.instance();
    classC = GetIt.instance();
    classD = GetIt.instance();
    classE = GetIt.instance();

  }

  @override
  Widget build(BuildContext context) {
    print("GetItPage2 build ");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Get It App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            GestureDetector(
              onTap: () {
                print("Class C ${classC.hashCode} ${classC?.classCCounter++}");
                setState(() {});
              },
              child: Text(
                'Class C ${classC?.classCCounter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
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
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/bloc2");
                },
                child: Text("BLOC Page 2")),
          ],
        ),
      ),
    );
  }
}
