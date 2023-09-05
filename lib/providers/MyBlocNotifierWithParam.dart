import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class MyBlocNotifierWithParam extends ChangeNotifier {
  AppState appState = AppState();

  MyBlocNotifierWithParam ( ) {

  }
  MyBlocNotifierWithParam.count(int count) {
    appState.counter = count;
  }

  void increment() {
    appState.counter++;
    notifyListeners();
  }
}
