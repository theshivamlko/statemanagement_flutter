import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/riverpod/myproviders.dart';

import 'MyRiverpodPage2.dart';
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
            Consumer(builder: (context, ref, child) {
              print("MyRiverpodPage1 Consumer ${ref}");

              var prd = ref.watch(provider1);
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(provider1).counter++;
                    },
                    child: Text(
                      ' Provider1 ${ref.read(provider1).counter} ',
                      style: mytextStyle2,
                    ),
                  ),
                ],
              );
            }),
            ChildWidget(),
            ChildWidget2(),
            Text(
              '============',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  //   print("MyPage1 Btn ${appState.hashCode} ");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => MyRiverpodPage2()));
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
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prod = ref.watch(stateprovider1);
    print("ChildWidget build ${prod.hashCode}");
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              prod.counter++;
              ref
                  .read(stateprovider1.notifier)
                  .update((s) => AppState.count(prod.counter));

              print(
                  "${ref.read(stateprovider1.notifier).state.counter} ${ref.read(stateprovider1.notifier).state.hashCode}");
            },
            child: Text(
              'StateProvider ConsumerWidget  \n${ref.read(stateprovider1).counter} \n',
              style: mytextStyle2,
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var p1 = ref.read(stateprovider1);
    print("ChildWidget2 build ${p1.hashCode}");
    return Column(
      children: [
        Consumer(builder: (context, ref, child) {
          var p2 = ref.watch(stateprovider1);
          return GestureDetector(
            onTap: () {
              ref.read(stateprovider1.notifier).state.counter++;
            },
            child: Text(
              'StateProvider ConsumerStatefulWidget  \n${ref.read(stateprovider1).counter} \n',
              style: mytextStyle2,
            ),
          );
        }),
      ],
    );
  }
}
