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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("MyRiverpodPage3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) {
              ref.watch(notifierProvider);
              return GestureDetector(
                onTap: () {
                  ref.read(notifierProvider).increment();
                },
                child: Text(
                  'ChangeNotifier Consumer ${ref
                      .read(notifierProvider)
                      .appState
                      .counter}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                ),
              );
            }
            ),
            Padding(padding: EdgeInsets.all(20)),
            Consumer(builder: (context, ref, child) {
              AsyncValue v = ref.watch(streamProvider);
              return v.when(data: (d) =>
                  Text(
                    'StreamProvider Consumer ${ref
                        .read(streamProvider)
                        .value
                        ?.counter}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  error: (ctx, error) => Text(error.toString()),
                  loading: () => CircularProgressIndicator());
            }
            ),
          ],
        ),
      ),
    );
  }
}
