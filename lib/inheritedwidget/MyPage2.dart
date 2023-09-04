import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/inheritedwidget/MyPage3.dart';
import 'package:statemanagement/inheritedwidget/StateInheritedState.dart';

class MyPage2 extends StatefulWidget {
  int mainCounter = 2;

  MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  int secondCounter = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print(
          "MyPage2 SchedulerBinding ${StateInheritedState.of(context)?.appState.counter} ${StateInheritedState.of(context)?.appState.hashCode}");
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        "MyPage2 build ${StateInheritedState.of(context)?.appState.counter} ${StateInheritedState.of(context)?.appState.hashCode} ${widget.mainCounter} $secondCounter");
    //  print("MyPage2 build ${appState?.counter} ${appState.hashCode}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('MyPage2'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${StateInheritedState.of(context)?.appState.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${widget.mainCounter}  $secondCounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  StateInheritedState.of(context)?.appState.counter++;

                  //   appState?.counter=   appState .counter  +1;

                  //    print("MyPage2 Counter ${appState} ${appState?.counter} ${StateInheritedState.of(context)?.appState.counter} ${StateInheritedState.of(context).hashCode}  ");
                  print(
                      "MyPage2 Counter ${StateInheritedState.of(context)?.appState.counter} ${StateInheritedState.of(context).hashCode}  ");

                  widget.mainCounter++;
                  secondCounter++;
                  setState(() {});
                },
                child: Text("Counter")),
            GestureDetector(
                onTap: () {

                 /* Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyPage3()));*/
                },
                child: ChildWidget())
          ],
        ));
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    print("didChangeDependencies ");

  }

  @override
  void didUpdateWidget(covariant MyPage2 oldWidget) {
    // TODO: implement didUpdateWidget
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
    var appState = StateInheritedState.of(context)?.appState;
    return GestureDetector(
        onTap: (){
          StateInheritedState.of(context)?.appState.counter++;
          setState(() {

          });
        },
        child: Text('${appState?.counter}',style: TextStyle(fontSize: 20),));
  }
}
