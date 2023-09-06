import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../AppState.dart';
import 'myproviders.dart';

class MyRiverpodPage2 extends ConsumerStatefulWidget {
  const MyRiverpodPage2({super.key});

  @override
  ConsumerState<MyRiverpodPage2> createState() => _MyRiverpodPage2State();
}

class _MyRiverpodPage2State extends ConsumerState<MyRiverpodPage2> {
  @override
  void dispose() {
    //  ref.invalidate(clockProvider);
    // TODO: implement dispose
    super.dispose();
  }

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
            TextField(),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, child) {
                final currentTime = ref.watch(clockProvider);
                print("StateNotifierProvider Consumer $currentTime ");

                final timeFormatted = DateFormat.Hms().format(currentTime);
                return GestureDetector(
                  onTap: () {
                  //  ref.read(clockProvider.notifier).changeTime();
                    ref.read(clockProvider.notifier).stream.listen((event) {
                      print("MyProviderPage2 stream $event ");
                    });
                  },
                  child: Text(
                    'StateNotifierProvider Consumer ${timeFormatted}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, child) {
                AsyncValue<AppState> futureAsync = ref.watch(futureProvider);
                print("FutureProvider Consumer $futureAsync ");
                return futureAsync.when(
                    data: (weather) => Text(
                          'FutureProvider Consumer ${weather.counter}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                    error: (err, stack) => Text('Error: $err'),
                    loading: () => CircularProgressIndicator());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
