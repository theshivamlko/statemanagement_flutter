import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../AppState.dart';
import 'myproviders.dart';

class MyRiverpodPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyProviderPage2 build ");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyRiverpodPage2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) {
              var prd = ref.watch(provider1);
              return GestureDetector(
                onTap: () {
                  ref.read(provider1).counter++;
                },
                child: Text(
                  'Provider Consumer ${ref.read(provider1).counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
            Padding(padding: EdgeInsets.all(20)),
            Consumer(builder: (context, ref, child) {
              var prod = ref.watch(stateprovider1);
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
                  'StateProvider Consumer ${ref.read(stateprovider1).counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
