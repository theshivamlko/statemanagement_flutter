import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../AppState.dart';
import 'myproviders.dart';

class MyRiverpodPage3 extends ConsumerWidget {
  const MyRiverpodPage3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MyRiverpodPage3 build ");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyRiverpodPage3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) {
              ref.watch(changenotifierProvider);
              return GestureDetector(
                onTap: () {
                  ref.read(changenotifierProvider).increment();
                },
                child: Text(
                  'ChangeNotifier Consumer ${ref.read(changenotifierProvider).appState.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
            Padding(padding: EdgeInsets.all(20)),
            Consumer(builder: (context, ref, child) {
              AsyncValue v = ref.watch(streamProvider);
              return v.when(
                  data: (d) => Text(
                        'StreamProvider Consumer ${ref.read(streamProvider).value?.counter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                  error: (ctx, error) => Text(error.toString()),
                  loading: () => CircularProgressIndicator());
            }),
            Padding(padding: EdgeInsets.all(20)),
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
    var prod = ref.watch(notifierProvider);
    print("ChildWidget build ${prod.hashCode}");
    return GestureDetector(
        onTap: () {
          ref.read(notifierProvider.notifier).increment();

          print(
              "${ref.read(notifierProvider.notifier).state.counter} ${ref.read(notifierProvider.notifier).state.hashCode}");
        },
        child: Text(
          'NotifierProvider ConsumerWidget  \n ${ref.read(notifierProvider).counter} ',
          style: mytextStyle2,
        ));
  }
}

class ChildWidget2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prod = ref.watch(stateNotifierProvider2(200));
    print("ChildWidget build ${prod.hashCode}");
    return GestureDetector(
        onTap: () {
          ref.watch(stateNotifierProvider2(200).notifier).increment() ;
        },
        child: Text(
          'NotifierProvider param ConsumerWidget  \n ${prod.counter} ',
          style: mytextStyle2,
        ));
  }
}
