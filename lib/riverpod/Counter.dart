 import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:statemanagement/AppState.dart';


class Counter extends Notifier<AppState> {
  AppState appState=AppState();
  Counter();
  Counter.count(this.appState);

  @override
  AppState build() {
    // initial value
    return AppState();
  }

  void increment() {
    state=appState.copy(counter: ++state.counter);
  /*   Timer(Duration(seconds: 2), () {
      print("notifyListeners");
      ref.notifyListeners();

    });*/
  }
  void increment2() {
    state=appState.copy2(counter2: ++state.counter2);

  }
}

class Counter2 extends StateNotifier<AppState> {
  AppState appState=AppState();

  Counter2.count(super.appState);


  @override
  AppState build() {
    // initial value
    return AppState();
  }

  void increment() {
    state=AppState.count(++state.counter);

    
  }
}
