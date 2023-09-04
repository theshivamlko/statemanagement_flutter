import 'package:flutter/material.dart';
import 'package:statemanagement/AppState.dart';

class StateInheritedState extends InheritedWidget {
  final AppState appState;

  StateInheritedState({required this.appState, required super.child});


  static AppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateInheritedState>()!.appState;
  }


/*  @override
  bool updateShouldNotify(StateInheritedState oldWidget)=>true;*/


  @override
  bool updateShouldNotify(StateInheritedState oldWidget) {
    print(
        "updateShouldNotify ${oldWidget.appState != appState} ${oldWidget.appState.hashCode} ${appState.hashCode}");

    return oldWidget.appState != appState;
  }
}
