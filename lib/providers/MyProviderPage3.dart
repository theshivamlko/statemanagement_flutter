import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/providers/MyBlocNotifier.dart';
import 'package:statemanagement/providers/MyBlocNotifier2.dart';
import 'package:statemanagement/providers/MyBlocNotifierWithParam.dart';

class MyProviderPage3 extends StatefulWidget {
  const MyProviderPage3({super.key});

  @override
  State<MyProviderPage3> createState() => _MyProviderPage3State();
}

class _MyProviderPage3State extends State<MyProviderPage3> {
 // late MyBlocNotifierWithParam myBlocNotifier;


  @override
  Widget build(BuildContext context) {
   // myBlocNotifier = Provider.of<MyBlocNotifierWithParam>(context);
  //  MyBlocNotifier2 bloc = context.watch<MyBlocNotifier2>();
    MyBlocNotifier2 bloc2=  context.read<MyBlocNotifier2>();
 //   print(
//        "MyProviderPage3 build  ${myBlocNotifier.hashCode}  ${bloc.hashCode}  ${bloc2.hashCode}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyProviderPage3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
           //     myBlocNotifier.increment();
              },
              child: Text(
            //    'Proxy ${myBlocNotifier.appState?.counter} \n '
                'Bloc1 ${bloc2.appState?.counter} \n '
                ,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  bloc2.increment();
                },
                child: Text("Counter")),
            Padding(padding: EdgeInsets.all(20)),
            GestureDetector(
              onTap: () {
                bloc2.increment();
              },
              child: Text(
                'context.watch<>',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            GestureDetector(
              onTap: () {
                bloc2.increment();
              },
              child: Text(
                'context.read<>',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            GestureDetector(onTap: () {}, child: ChildWidget())
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    MyBlocNotifier2 bloc2=  context.read<MyBlocNotifier2>();


    return Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Text(
              'BLOC1 State ${bloc2?.appState.counter}',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
