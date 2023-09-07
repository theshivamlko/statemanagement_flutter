import 'package:flutter/material.dart';
import 'package:statemanagement/CommonState.dart';

class AppState implements CommonState {
  int counter = 0;
  int counter2 = 0;

  AppState.count(this.counter);

  AppState();

  AppState copy({int? counter}) {
    AppState appState = AppState();
    appState.counter = counter!;
    return appState;
  }
  AppState copy2({int? counter2}) {
    AppState appState = AppState();
    appState.counter2 = counter2!;
    return appState;
  }

  increment() {
    counter++;
  }


  @override
  void dispose() {
    // TODO: implement dispose
  }
}
