import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    print(
        "MyPage2 build ${StateInheritedState.of(context)?.counter} ${StateInheritedState.of(context)?.hashCode} ${widget.mainCounter} $secondCounter");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('MyPage2'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '${StateInheritedState.of(context)?.counter} A'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'BB'),
            BottomNavigationBarItem(icon: Icon(Icons.accessible), label: 'CC'),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${StateInheritedState.of(context)?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${widget.mainCounter}  $secondCounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  StateInheritedState.of(context)?.counter++;
                  // int n=  StateInheritedState.of(context)?.counter??0 ;
                  // StateInheritedState.of(context)?.copy(++n, Colors.black12);

                  //   appState?.counter=   appState .counter  +1;

                  //    print("MyPage2 Counter ${appState} ${appState?.counter} ${StateInheritedState.of(context)?.appState.counter} ${StateInheritedState.of(context).hashCode}  ");
                  print(
                      "MyPage2 Counter ${StateInheritedState.of(context)?.counter} ${StateInheritedState.of(context).hashCode}  ");
                  //     widget.mainCounter++;
                  //    secondCounter++;
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
    print("didChangeDependencies ");
    super.didChangeDependencies();
    var data = StateInheritedState.of(context);
    secondCounter = data?.counter ?? secondCounter;
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
    var appState = StateInheritedState.of(context);
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              StateInheritedState.of(context)?.counter++;
              setState(() {});
            },
            child: Text(
              '${appState?.counter}',
              style: TextStyle(fontSize: 20),
            )),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StateInheritedState(
                          appState: StateInheritedState.of(context)!,
                          child: MyPage3())));
            },
            child: Text(
              'Page3',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
