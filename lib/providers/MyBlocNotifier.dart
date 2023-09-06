
import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class MyBlocNotifier extends ChangeNotifier{
  MyBlocNotifier();
  MyBlocNotifier.count(this.appState);
  AppState appState = AppState();



  void increment(){
    appState.counter++;
    notifyListeners();
  }


}
