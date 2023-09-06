import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'myproviders.dart';

class MyRiverpodPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyRiverpodPage1 build  ");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyRiverpodPage1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Riverpod',
            ),
            Consumer(builder: (context, ref, child) {
              print("MyRiverpodPage1 Consumer ${ref}");
              return Column(
                children: [
                  Text(
                    ' Riverpod1 ${ref.read(provider1).counter} ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.watch(provider1).counter++;
                      },
                      child: Text("Counter")),
                ],
              );
            }),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            GestureDetector(
              onTap: () {
                //  bloc.increment();
              },
              child: Text(
                ' ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  //   print("MyPage1 Btn ${appState.hashCode} ");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (ctx) =>MyProviderPage2()));
                },
                child: Text("MyProviderPage2")),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (ctx) =>  MyProviderPage3()));
                },
                child: Text("MyProviderPage3")),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (ctx) =>MyProviderPage4()));
                },
                child: Text("MyProviderPage4")),
            ChildWidget(),
            ChildWidget2()
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              ref.read(provider2).counter++;
            },
            child: Text(
              'ChildWidget  ${ref.read(provider2).counter} \n',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}

class ChildWidget2 extends ConsumerStatefulWidget {
  const ChildWidget2({super.key});

  @override
  ConsumerState<ChildWidget2> createState() => _ChildWidget2State();
}

class _ChildWidget2State extends ConsumerState<ChildWidget2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              ref.read(provider2).counter++;
            },
            child: Text(
              'ChildWidget2  ${ref.read(provider2).counter} \n',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
