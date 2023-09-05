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
  late MyBlocNotifierWithParam myBlocNotifier;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myBlocNotifier = Provider.of<MyBlocNotifierWithParam>(context);
    MyBlocNotifier2 bloc = Provider.of<MyBlocNotifier2>(context);

    print("MyProviderPage3 build  ${myBlocNotifier.appState.hashCode}  ${bloc.appState.hashCode}");

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
                myBlocNotifier.increment();
              },
              child: Text(
                'Proxy ${myBlocNotifier.appState?.counter} \n '
                    'Bloc1 ${bloc.appState?.counter} \n ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(onPressed: () {
              bloc.increment();
            }, child: Text("Counter")),
            Padding(padding: EdgeInsets.all(20)),
            ChildWidget()
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    MyBlocNotifierWithParam myBlocNotifier = Provider.of<MyBlocNotifierWithParam>(context);

    return Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Text(
              'BLOC1 State ${myBlocNotifier?.appState.counter}',
              style: TextStyle(fontSize: 20),
            )),

      ],
    );
  }


}
