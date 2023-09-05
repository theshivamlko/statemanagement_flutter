
import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class MyBlocNotifier2 extends ChangeNotifier{


  AppState appState = AppState();



  void increment(){
    appState.counter++;
    notifyListeners();
  }


}
