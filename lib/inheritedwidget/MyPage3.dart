import 'package:flutter/material.dart';
import 'package:statemanagement/inheritedwidget/AppStateInherited.dart';
import 'package:statemanagement/inheritedwidget/ParentStateInherited.dart';
import 'package:statemanagement/inheritedwidget/StudentStateInherited.dart';

class MyPage3 extends StatefulWidget {
  const MyPage3({super.key});

  @override
  State<MyPage3> createState() => _MyPage3State();
}

class _MyPage3State extends State<MyPage3> {
  @override
  Widget build(BuildContext context) {
    var appState = AppStateInherited.of(context);
    var parentState = ParentStateInherited.of(context);
    var studentState = StudentStateInherited.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('MyPage3'),
        ),
        body: GestureDetector(
            onTap: () {
              AppStateInherited.of(context)?.counter++;
              setState(() {});
            },
            child: Text(
                'App State ${appState?.counter} \n'
                'Parent State ${parentState?.salary} \n'
                'Student State ${studentState?.roll} \n',
                style: TextStyle(fontSize: 20))));
  }
}
