import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../AppState.dart';
import 'CustomNotifier.dart';
import 'myproviders.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'MyRiverpodPage3.g.dart';


/*
final stateprovider2 = StateProvider<AppState>((ref) {
  print("  StateProvider ${ref.hashCode} ");
  return AppState.count(00);
});
*/
// Generating above with generator
@Riverpod(keepAlive: false)
AppState myProviderGenerated(MyProviderGeneratedRef ref){
  return AppState.count(-123);
}




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
                  if(ref.read(changenotifierProvider).appState.counter==5){
                    ref.invalidate(changenotifierProvider);
                  }
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
                  data: (d) => GestureDetector(
                    onTap: (){
                      ref.refresh(streamProvider);

                    },
                    child: Text(
                          'StreamProvider Consumer ${ref.read(streamProvider).value?.counter}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                  ),
                  error: (ctx, error) => Text(error.toString()),
                  loading: () => CircularProgressIndicator());
            }),
            Padding(padding: EdgeInsets.all(20)),
            ChildWidget(),
            ChildWidget2(),
            ChildWidget3(),
            ChildWidget4(),
            ChildWidget5()
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

class ChildWidget3 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prod = ref.watch(notifierProvider.select((value) => value.counter) );
    print("ChildWidget build ${prod.hashCode}");
    return GestureDetector(
        onTap: () {
      //   ref.read(notifierProvider.notifier).increment();
      //   ref.read(notifierProvider.notifier).increment2();
         // ref.read(notifierProvider).counter2++;
        },
        child: Text(
          'NotifierProvider   SELECT  \n ${ref.read(notifierProvider).counter}${ref.read(notifierProvider).counter2} ',
          style: mytextStyle2,
        ));
  }
}

class ChildWidget4 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prod = ref.watch(myProviderGeneratedProvider );
    print("ChildWidget build ${prod.hashCode}");
    return GestureDetector(
        onTap: () {
          ref.read(myProviderGeneratedProvider).increment();
          // ref.read(notifierProvider).counter2++;
        },
        child: Text(
          'GENERATED  \n ${ref.read(myProviderGeneratedProvider).counter} ${ref.read(myProviderGeneratedProvider).counter2} ',
          style: mytextStyle2,
        ));
  }
}

class ChildWidget5 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prod = ref.watch(customNotifierProvider );
    print("ChildWidget5 build ${prod.hashCode}");
    return GestureDetector(
        onTap: () {
          ref.read(customNotifierProvider.notifier).increment();
          // ref.read(notifierProvider).counter2++;
        },
        child: Text(
          'GENERATED  \n ${ref.read(customNotifierProvider).counter}  ',
          style: mytextStyle2,
        ));
  }
}
