import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/AppState.dart';
import 'package:statemanagement/riverpod/myproviders.dart';

import 'MyRiverpodPage2.dart';
import 'MyRiverpodPage3.dart';
import 'myproviders.dart';

class MyRiverpodPage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                  onPressed: () async {
                    //   print("MyPage1 Btn ${appState.hashCode} ");
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => MyRiverpodPage2()));

                    Timer(Duration(seconds: 5), () {
                      //  MyRiverpodPage2 value still exists
                      print(
                          "MyProviderPage1 StateNotifierProvider Consumer ${ref.read(clockProvider)} ");
                    });
                  },
                  child: Text("MyProviderPage2"));
            }),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => MyRiverpodPage3()));
                  print(
                      "MyProviderPage1 StreamProvider Consumer ${ref.read(streamProvider).value?.counter} ");
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
    ref.listen(stateprovider1, (previous, next) {
      print("listen ${previous?.counter}  ${next?.counter} ");
    },onError: (error, stackTrace) {
      print("onError ${error}    ");
    },);
    print("ChildWidget build ${prod.hashCode}");
    return GestureDetector(
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
        ));
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
    var subs = ref.listenManual(
      stateprovider1,
          (previous, next) {
        print("listenManual ${previous?.counter}  ${next?.counter} ");
      },
      onError: (error, stackTrace) {
        print("onError ${error}    ");
      },
    );

    Timer(Duration(seconds: 3), () {
    subs.close();
    });
  }
  @override
  Widget build(BuildContext context) {
    var p1 = ref.watch(stateprovider1);
    print("ChildWidget2 build ${p1.hashCode}");
    return GestureDetector(
      onTap: () {
        ref.read(stateprovider1.notifier).update((state) => AppState.count(++p1.counter)) ;
      },
      child: Text(
        'StateProvider ConsumerStatefulWidget  \n${ref.read(stateprovider1).counter} \n',
        style: mytextStyle2,
      ),
    );
  }
}
