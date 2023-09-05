import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class MyBlocNotifier2 extends ChangeNotifier {
  AppState appState = AppState();

  MyBlocNotifier2(){
   // Future.sync(() => Duration(seconds: 5));
  }

  void increment() {
    appState.counter++;
    notifyListeners();
  }
}
