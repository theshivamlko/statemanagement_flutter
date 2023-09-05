import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:statemanagement/ParentState.dart';
import 'package:statemanagement/StudentState.dart';
import 'package:statemanagement/inheritedwidget/MyPage3.dart';
import 'package:statemanagement/inheritedwidget/AppStateInherited.dart';
import 'package:statemanagement/inheritedwidget/ParentStateInherited.dart';
import 'package:statemanagement/inheritedwidget/StudentStateInherited.dart';

class MyPage2 extends StatefulWidget {
  int mainCounter = 2;

  MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  StudentState studentState = StudentState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('MyPage2'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '${AppStateInherited.of(context)?.counter} A'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'BB'),
            BottomNavigationBarItem(icon: Icon(Icons.accessible), label: 'CC'),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'App State ${AppStateInherited.of(context)?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Parent State ${ParentStateInherited.of(context)?.salary}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Student State ${StudentStateInherited.of(context)?.roll}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  AppStateInherited.of(context)?.counter++;
                  ParentStateInherited.of(context)!.salary =
                      ParentStateInherited.of(context)!.salary * 1.2;
                  print(
                      "MyPage2 Counter ${AppStateInherited.of(context)?.counter} ${AppStateInherited.of(context).hashCode}  ");

                  setState(() {});
                },
                child: Text("Counter")),
            GestureDetector(
                onTap: () {
                  /* Navigator.push(
                          context, MaterialPageRoute(builder: (_) => MyPage3()));*/
                },
                child: StudentStateInherited(
                    state: studentState, child: ChildWidget()))
          ],
        ));
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies ");
    super.didChangeDependencies();
    var data = AppStateInherited.of(context);
  }

  @override
  void didUpdateWidget(covariant MyPage2 oldWidget) {
    print("didUpdateWidget ${oldWidget.mainCounter} ");
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ${oldWidget.mainCounter} ");
  }
}

class ChildWidget extends StatefulWidget {

  ChildWidget({super.key});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    var appState = AppStateInherited.of(context);
    var parentState = ParentStateInherited .of(context);
    var studentState = StudentStateInherited .of(context);
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              studentState?.copy(studentState .roll + 1 );
              print("ChildWidget ${studentState?.roll} ${studentState?.hashCode}");
              setState(() {});

            },
            child: Text(
              'App State ${appState?.counter} \n'
                  'Parent State ${parentState?.salary} \n'
                  'Student State ${studentState?.roll} \n',
              style: TextStyle(fontSize: 20),
            )),
        GestureDetector(
            onTap: () {

              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => MyPage3()));

              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => MyPage3()));
            },
            child: Text(
              'Page3',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }

  @override
  void didChangeDependencies() {
    print("ChildWidget didChangeDependencies ");
    super.didChangeDependencies();
    var data = AppStateInherited.of(context);
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    print("ChildWidget didUpdateWidget ${oldWidget} ");
    super.didUpdateWidget(oldWidget);
  }
}
