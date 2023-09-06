import 'package:flutter/material.dart';
import 'package:statemanagement/CommonState.dart';

class AppState implements CommonState {
  int counter = 0;

  AppState.count(this.counter);

  AppState();

  AppState copy({int? counter}) {
    AppState appState = AppState();
    appState.counter = counter!;
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
